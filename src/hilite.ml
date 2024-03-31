type error = [ `Unknown_lang of string ]

let langs = [ "ocaml"; "dune"; "opam"; "sh"; "shell"; "diff"; "bash" ]

let filteri p l =
  let rec aux i acc = function
    | [] -> List.rev acc
    | x :: l -> aux (i + 1) (if p i x then x :: acc else acc) l
  in
  aux 0 [] l

let span class_gen t =
  let drop_last lst =
    let l = List.length lst in
    filteri (fun i _ -> i < l - 1) lst
  in
  let span_gen c s =
    let s =
      let buf = Buffer.create 128 in
      Cmarkit_html.buffer_add_html_escaped_string buf s;
      Buffer.contents buf
    in
    "<span class='" ^ class_gen c ^ "'>" ^ s ^ "</span>"
  in
  span_gen (String.concat "-" (drop_last t))

let mk_block lang =
  List.map
    (List.map (fun (scope, str) -> (span (fun c -> lang ^ "-" ^ c) scope) str))

let rec highlight_tokens i spans line = function
  | [] -> List.rev spans
  | tok :: toks ->
      let j = TmLanguage.ending tok in
      assert (j > i);
      let text = String.sub line i (j - i) in
      let scope =
        match TmLanguage.scopes tok with
        | [] -> []
        | scope :: _ -> String.split_on_char '.' scope
      in
      highlight_tokens j ((scope, text) :: spans) line toks

let highlight_string t grammar stack str =
  let lines = String.split_on_char '\n' str in
  let rec loop stack acc = function
    | [] -> List.rev acc
    | line :: lines ->
        (* Some patterns don't work if there isn't a newline *)
        let line = line ^ "\n" in
        let tokens, stack = TmLanguage.tokenize_exn t grammar stack line in
        let spans = highlight_tokens 0 [] line tokens in
        loop stack (spans :: acc) lines
  in
  loop stack [] lines

let add_name name = function
  | `Assoc assoc -> `Assoc (("name", `String name) :: assoc)
  | _ -> failwith "Failed to add name, object not given"

let lang_to_plists s =
  match String.lowercase_ascii s with
  | "ocaml" -> [ Jsons.ocaml_interface; Jsons.ocaml ]
  | "dune" -> [ Jsons.dune ]
  | "opam" -> [ Jsons.opam ]
  | "sh" -> [ Jsons.shell |> add_name "sh" ]
  | "shell" -> [ Jsons.shell |> add_name "shell" ]
  | "bash" -> [ Jsons.shell |> add_name "bash" ]
  | "diff" -> [ Jsons.diff |> add_name "diff" ]
  | _ -> []

type tm_lookup_method = [ `Name | `Scope_name | `Filetype ]

let find_grammar_fun = function
  | `Name -> TmLanguage.find_by_name
  | `Scope_name -> TmLanguage.find_by_scope_name
  | `Filetype -> TmLanguage.find_by_filetype

let src_code_to_tyxml_html ?(lookup_method = `Name) ?tm ~lang src =
  let t =
    match tm with
    | Some tm -> tm
    | None ->
        let t = TmLanguage.create () in
        let plist = lang_to_plists lang in
        let grammars = List.map TmLanguage.of_yojson_exn plist in
        List.iter (TmLanguage.add_grammar t) grammars;
        t
  in
  match (find_grammar_fun lookup_method) t lang with
  | None -> Error (`Unknown_lang lang)
  | Some grammar ->
      Ok (highlight_string t grammar TmLanguage.empty src |> mk_block lang)

let src_code_to_html ?lookup_method ?tm ~lang src =
  src_code_to_tyxml_html ?lookup_method ?tm ~lang src |> function
  | Ok tyxml ->
      Ok
        ("<pre><code>"
        ^ (String.concat "" @@ List.concat tyxml)
        ^ "</code></pre>")
  | Error _ as e -> e

module Grammars = struct
  include Jsons
end
