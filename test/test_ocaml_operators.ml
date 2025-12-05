let md =
  {| Testing OCaml operator and literal syntax highlighting:

```ocaml
# 50 * 50;;
- : int = 2500
```

```ocaml
# 6.28;;
- : float = 6.28

```ocaml
# let u = [1; 2; 3; 4];;
val u : int list = [1; 2; 3; 4]

# ["this"; "is"; "mambo"];;
- : string list = ["this"; "is"; "mambo"]
```

```ocaml
# 9 :: u;;
- : int list = [9; 1; 2; 3; 4]
```
|}

let test_transform () =
  let omd_t = Cmarkit.Doc.of_string md |> Hilite_markdown.transform in
  Format.printf "%s" (Cmarkit_html.of_doc ~safe:false omd_t)

let () = test_transform ()
