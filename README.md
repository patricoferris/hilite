Hilite 🎨
---------

A small library that generates HTML ready for syntax-highlighting with CSS by parsing markdown documents.

Currently only some OCaml-related syntaxes are supported directly. For example
the [test.md](test/test.md) file can be converted with:

```ocaml
# Cmarkit.Doc.of_string (read_file "test/test.md")
  |> Hilite_markdown.transform
  |> Cmarkit_html.of_doc ~safe:false;;
- : string =
"<p>&quot;Hello World!&quot; in OCaml looks like:</p>\n<pre><code><span class='ocaml-keyword-other'>let</span><span class='ocaml-source'> </span><span class='ocaml-constant-language-unit'>()</span><span class='ocaml-source'> </span><span class='ocaml-keyword-operator'>=</span><span class='ocaml-sourc"... (* string length 609; truncated *)
```
