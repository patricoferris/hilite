module Options = struct
  type t = { ocaml_mdx_syntax : bool }

  let default = { ocaml_mdx_syntax = false }
  let set_ocaml_mdx_syntax ocaml_mdx_syntax _ = { ocaml_mdx_syntax }
end

module String = struct
  include String

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
                match
                  (String.lowercase_ascii lang, options.ocaml_mdx_syntax)
                with
                | "ocaml", true ->
                    let mdx_lines =
                      List.map (fun s -> String.starts_with ~prefix:"#" s) code
                      (* We add an extra line for the </pre></code> HTML line *)
                      @ [ false ]
                    in
                    (* We could use a regular expression here, but if anybody has more
                       than one trailing blank space on their newline then maybe they
                       should fix that. *)
                    let sep = "<span class='ocaml-source'>\n</span>" in
                    let sep_space = "<span class='ocaml-source'> \n</span>" in
                    let html_lines =
                      String.cuts ~sep html
                      |> List.concat_map (String.cuts ~sep:sep_space)
                    in
                    if List.length html_lines <> List.length mdx_lines then begin
                      let str =
                        Format.sprintf
                          "MDX OCaml syntax highlighting: please report this \
                           bug along with your codeblock\n\n\
                           %s"
                          (String.concat "\n" code)
                      in
                      failwith str
                    end;
                    let lines = List.combine mdx_lines html_lines in
                    let html =
                      List.fold_left
                        (fun s (hashed, line) ->
                          if hashed then begin
                            (* Logic for the first line *)
                            match String.cuts ~sep:"<pre><code>" line with
                            | "" :: [ line ] ->
                                "<pre><code>" ^ s
                                ^ "<span class='ocaml-mdx-hash'>#</span>" ^ line
                                ^ sep
                            | _ ->
                                s ^ "<span class='ocaml-mdx-hash'>#</span>"
                                ^ line ^ sep
                          end
                          else s ^ line ^ sep)
                        "" lines
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
