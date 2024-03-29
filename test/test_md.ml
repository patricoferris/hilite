let md =
  {| OCaml is a great language, e.g.

```ocaml
let add a b = a + b
```

And some bash...

```bash
~/$ ls ~/.opam
```

And some sh...

```sh
~/$ ls ~/.opam
```
|}

let test_transform () =
  let omd_t = Cmarkit.Doc.of_string md |> Hilite_markdown.transform in
  Format.printf "%s" (Cmarkit_html.of_doc ~safe:false omd_t)

let () = test_transform ()
