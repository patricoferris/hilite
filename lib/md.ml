let ignored_langs = [ "bash"; "sh"; ""; "yaml"; "markdown"; "c"; "diff" ]

let transform blocks =
  let f (b : Omd.block) =
    match b.bl_desc with
    | Omd.Code_block (lang, src) -> (
        if List.mem lang ignored_langs then b
        else
          match Syntax.src_code_to_html ~lang ~src with
          | Ok html -> { b with bl_desc = Omd.Html_block html }
          | Error (`Msg s) -> failwith s )
    | _ -> b
  in
  List.map f blocks
