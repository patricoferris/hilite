let md =
  {| Testing OCaml operator and literal syntax highlighting:

```ocaml
# 50 * 50;;
# 6.28;;
# 2 * if "hello" = "world" then 3 else 5;;
# 50 + (* A comment *) 50;;
```
|}

let test_transform () =
  let omd_t = Cmarkit.Doc.of_string md |> Hilite_markdown.transform in
  Format.printf "%s" (Cmarkit_html.of_doc ~safe:false omd_t)

let () = test_transform ()
