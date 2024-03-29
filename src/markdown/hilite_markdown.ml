let transform ?(skip_unknown_languages = true) ?lookup_method ?tm
    (doc : Cmarkit.Doc.t) =
  let block _mapper (b : Cmarkit.Block.t) =
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
            match Hilite.src_code_to_html ?lookup_method ?tm ~lang code with
            | Ok html ->
                let h = Cmarkit.Block_line.list_of_string html in
                `Map (Some (Cmarkit.Block.Html_block (h, meta)))
            | Error (`Unknown_lang s) ->
                if skip_unknown_languages then `Map (Some b)
                else failwith ("Unknown language: " ^ s))
        | _ -> `Map (Some b))
    | _ -> `Default
  in
  let mapper = Cmarkit.Mapper.make ~block () in
  Cmarkit.Mapper.map_doc mapper doc
