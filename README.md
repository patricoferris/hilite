Hilite 🎨
---------

A small library that generates HTML ready for syntax-highlighting with CSS by parsing markdown documents.

Currently only some OCaml-related syntaxes are supported.

```ocaml
let md = {|
"Hello World!" in OCaml looks like:

~~~ocaml
let () = print_endline "Hello World!"
~~~
|}
```

And converting is as simple as...


```ocaml
# Cmarkit.Doc.of_string md |> Hilite.Md.transform |> Cmarkit_html.of_doc ~safe:true;;
- : string =
"<p>&quot;Hello World!&quot; in OCaml looks like:</p>\n<!-- CommonMark HTML block omitted -->\n"
```
