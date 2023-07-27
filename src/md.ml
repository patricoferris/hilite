let langs = [ "ocaml"; "dune"; "opam"; "sh"; "shell"; "diff"; "bash" ]

let rec transform_block block =
  let f (b : Cmarkit.Block.t) =
    match b with
    | Cmarkit.Block.Code_block (node, meta) -> (
        let info =
          Cmarkit.Block.Code_block.info_string node |> Option.map fst
        in
        let code =
          Cmarkit.Block.Code_block.code node
          |> List.map Cmarkit.Block_line.to_string
          |> String.concat "\n"
        in
        match
          Option.bind info Cmarkit.Block.Code_block.language_of_info_string
        with
        | Some (lang, _) -> (
            if not (List.mem lang langs) then b
            else
              match Syntax.src_code_to_html ~lang ~src:code with
              | Ok html ->
                  (* let buf = Buffer.create 128 in
                     Cmarkit_html.buffer_add_html_escaped_string buf html; *)
                  let h = Cmarkit.Block_line.list_of_string html in
                  Cmarkit.Block.Html_block (h, meta)
              | Error (`Msg s) -> failwith s)
        | _ -> b)
    | Cmarkit.Block.Blocks (bs, meta) ->
        Cmarkit.Block.Blocks (List.map transform_block bs, meta)
    | _ -> b
  in
  f block

let transform (doc : Cmarkit.Doc.t) =
  let map _ v : Cmarkit.Block.t Cmarkit.Mapper.result =
    Cmarkit.Mapper.ret (transform_block v)
  in
  let mapper = Cmarkit.Mapper.make ~block:map () in
  Cmarkit.Mapper.map_doc mapper doc
