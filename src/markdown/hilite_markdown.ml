module Options = struct
  type t = { ocaml_mdx_syntax : bool }

  let default = { ocaml_mdx_syntax = false }
  let set_ocaml_mdx_syntax ocaml_mdx_syntax _ = { ocaml_mdx_syntax }
end

module String = struct
  include String

  (* This code is Copyright (c) 2015 The astring programmers.
     SPDX-License-Identifier: ISC *)
  let bytes_unsafe_blit_string s sfirst d dfirst len =
    Bytes.(unsafe_blit (unsafe_of_string s) sfirst d dfirst len)

  let unsafe_string_sub s first len =
    let b = Bytes.create len in
    bytes_unsafe_blit_string s first b 0 len;
    Bytes.unsafe_to_string b

  let add_sub ~no_empty s ~start ~stop acc =
    if start = stop then if no_empty then acc else empty :: acc
    else unsafe_string_sub s start (stop - start) :: acc

  let fcuts ~no_empty ~sep s =
    let sep_len = length sep in
    let s_len = length s in
    let max_sep_idx = sep_len - 1 in
    let max_s_idx = s_len - sep_len in
    let rec check_sep start i k acc =
      if k > max_sep_idx then
        let new_start = i + sep_len in
        scan new_start new_start (add_sub ~no_empty s ~start ~stop:i acc)
      else if unsafe_get s (i + k) = unsafe_get sep k then
        check_sep start i (k + 1) acc
      else scan start (i + 1) acc
    and scan start i acc =
      if i > max_s_idx then
        if start = 0 then if no_empty && s_len = 0 then [] else [ s ]
        else List.rev (add_sub ~no_empty s ~start ~stop:s_len acc)
      else if unsafe_get s i = unsafe_get sep 0 then check_sep start i 1 acc
      else scan start (i + 1) acc
    in
    scan 0 0 []

  let cuts ?(empty = true) ~sep s = fcuts ~no_empty:(not empty) ~sep s
end

let _debug_lists a b =
  let rec loop = function
    | (x, d) :: xs, y :: ys ->
        let d =
          Option.map (fun v -> Re.Group.get v 0) d |> Option.value ~default:""
        in
        Fmt.epr "X:(%a:%s)\nY:(%a)\n\n"
          Fmt.(quote string)
          x d
          Fmt.(quote string)
          y;
        loop (xs, ys)
    | [], [] -> Fmt.epr "All done\n"
    | xs, [] ->
        Fmt.epr "List X has some: %a\n"
          Fmt.(list (quote string))
          (List.map fst xs)
    | [], ys -> Fmt.epr "List Y has some: %a\n" Fmt.(list (quote string)) ys
  in
  loop (a, b)

let html_newlines =
  let notnl_or_angle = Re.(diff notnl (char '<')) in
  let newlines = Re.(seq [ rep notnl_or_angle; str "\n</span>" ]) in
  let source = Re.(seq [ str "<span class='ocaml-source'>"; newlines ]) in
  let comment =
    Re.(seq [ str "<span class='ocaml-comment-block'>"; newlines ])
  in
  let dquote =
    Re.(seq [ str "<span class='ocaml-string-quoted-double'>"; newlines ])
  in
  let braced =
    Re.(seq [ str "<span class='ocaml-string-quoted-braced'>"; newlines ])
  in
  let regexp = Re.alt [ source; comment; dquote; braced ] in
  Re.compile regexp

let html_break_on_newlines s =
  let split = Re.split_full html_newlines s in
  let rec loop acc = function
    | `Text text :: `Delim delim :: rest ->
        loop ((text, Some delim) :: acc) rest
    | `Delim delim :: rest -> loop (("", Some delim) :: acc) rest
    | `Text text :: rest -> loop ((text, None) :: acc) rest
    | [] -> List.rev acc
  in
  loop [] split

let transform ?(options = Options.default) ?(skip_unknown_languages = true)
    ?lookup_method ?tm (doc : Cmarkit.Doc.t) =
  let block _mapper (b : Cmarkit.Block.t) =
    match b with
    | Cmarkit.Block.Code_block (node, meta) -> (
        let info =
          Cmarkit.Block.Code_block.info_string node |> Option.map fst
        in
        let mdcode = Cmarkit.Block.Code_block.code node in
        let code = List.map Cmarkit.Block_line.to_string mdcode in
        match
          Option.bind info Cmarkit.Block.Code_block.language_of_info_string
        with
        | Some (lang, _) -> (
            let apply_mdx =
              options.ocaml_mdx_syntax
              && String.equal (String.lowercase_ascii lang) "ocaml"
              && Option.map
                   (String.starts_with ~prefix:"#")
                   (try Some (List.hd code) with Failure _ -> None)
                 |> Option.value ~default:false
            in
            let no_hash_code =
              if apply_mdx then
                List.map
                  (fun code ->
                    if String.starts_with ~prefix:"#" code then
                      String.sub code 1 (String.length code - 1)
                    else code)
                  code
              else code
            in
            match
              Hilite.src_code_to_html ?lookup_method ?tm ~lang
                (String.concat "\n" no_hash_code)
            with
            | Ok html -> (
                match (String.lowercase_ascii lang, apply_mdx) with
                | "ocaml", true ->
                    let html_lines = html_break_on_newlines html in
                    let mdx_lines =
                      List.map (fun s -> String.starts_with ~prefix:"#" s) code
                      (* We add an extra line for the </pre></code> HTML line *)
                      @
                      if List.length code = List.length html_lines then []
                      else [ false ]
                    in
                    if List.length html_lines <> List.length mdx_lines then begin
                      Format.eprintf
                        "MDX OCaml syntax highlighting: please report this bug \
                         along with your codeblock\n\n\
                         %s\n"
                        (String.concat "\n" code);
                      _debug_lists html_lines code;

                      invalid_arg "OCaml MDX mode"
                    end;
                    let lines = List.combine mdx_lines html_lines in
                    let html =
                      List.mapi
                        (fun idx (hashed, (line, delim)) ->
                          let delim =
                            Option.map (fun d -> Re.Group.get d 0) delim
                            |> Option.value ~default:""
                          in
                          if hashed then begin
                            if not (Int.equal idx 0) then
                              "<span class='ocaml-mdx-hash'>#</span>" ^ line
                              ^ delim
                            else
                              (* Logic for the first line *)
                              match String.cuts ~sep:"<pre><code>" line with
                              | "" :: [ line ] ->
                                  "<pre><code><span \
                                   class='ocaml-mdx-hash'>#</span>" ^ line
                                  ^ delim
                              | _ ->
                                  "<span class='ocaml-mdx-hash'>#</span>" ^ line
                                  ^ delim
                          end
                          else line ^ delim)
                        lines
                      |> String.concat ""
                    in
                    let h = Cmarkit.Block_line.list_of_string html in
                    `Map (Some (Cmarkit.Block.Html_block (h, meta)))
                | _ ->
                    let h = Cmarkit.Block_line.list_of_string html in
                    `Map (Some (Cmarkit.Block.Html_block (h, meta))))
            | Error (`Unknown_lang s) ->
                if skip_unknown_languages then `Map (Some b)
                else failwith ("Unknown language: " ^ s))
        | _ -> `Map (Some b))
    | _ -> `Default
  in
  let mapper = Cmarkit.Mapper.make ~block () in
  Cmarkit.Mapper.map_doc mapper doc
