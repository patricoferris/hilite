let pp_err s =
  Format.printf "[ Error ] %s" s;
  -1

let file lang path =
  Bos.OS.File.read (Fpath.v path) |> function
  | Ok src -> (
      Hilite.Syntax.src_code_to_html ~lang ~src |> function
      | Ok s ->
          Format.print_string s;
          0
      | Error (`Msg m) -> pp_err m )
  | Error (`Msg m) -> pp_err m

let exp lang exp =
  Hilite.Syntax.src_code_to_html ~lang ~src:exp |> function
  | Ok s ->
      Format.print_string s;
      0
  | Error (`Msg m) -> pp_err m

open Cmdliner

let lang =
  Arg.required
  @@ Arg.pos 0 Arg.(some string) None
  @@ Arg.info ~doc:"The programming language" ~docv:"LANG" []

let path =
  Arg.required
  @@ Arg.pos 1 Arg.(some string) None
  @@ Arg.info ~doc:"The path to the file" ~docv:"PATH" []

let expression =
  Arg.required
  @@ Arg.pos 1 Arg.(some string) None
  @@ Arg.info ~doc:"The expression to highlight" ~docv:"EXPR" []

let file =
  let doc = "Highlight a file containing some code" in
  (Term.(const file $ lang $ path), Term.info "file" ~doc)

let expr =
  let doc = "Highlight a single expression" in
  (Term.(const exp $ lang $ expression), Term.info "expr" ~doc)

let cmds = [ file; expr ]

let default_cmd =
  let doc = "a command-line interface for highlighting code to HTML" in
  (Term.(ret (const (`Help (`Pager, None)))), Term.info "hilite" ~doc)

let term_exit (x : int Term.result) = Term.exit x

let () = term_exit @@ Term.eval_choice default_cmd cmds
