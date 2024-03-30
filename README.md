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

## Customisation

Hilite supports users loading their own grammars so they can do custom,
build-time syntax highlighting. Users most provided a collection of textmate
grammars to the transformation function.

Here we will use a predefined grammar that comes along with the `Hilite` library.

```ocaml
# let tm =
    let t = TmLanguage.create () in
    let grammar = TmLanguage.of_yojson_exn Hilite.Grammars.diff in
    TmLanguage.add_grammar t grammar;
    t
val tm : TmLanguage.t = <abstr>
```

With this we can now highlight code blocks that start with `diff`.

```ocaml
# Cmarkit.Doc.of_string (read_file "test/test_diff.md")
  |> Hilite_markdown.transform ~lookup_method:`Filetype ~tm
  |> Cmarkit_html.of_doc ~safe:false;;
- : string =
"<p>A diff block!</p>\n<pre><code><span class='patch-punctuation-definition-deleted'>-</span><span class='patch-markup-deleted'>  module Sel = (val if is_osx () then (module Mac)\n</span><span class='patch-punctuation-definition-deleted'>-</span><span class='patch-markup-deleted'>                    e"... (* string length 1176; truncated *)
```

This example also shows a use off `lookup_method` to change how `TmLanguage`
finds the grammar based on the code block _infostring_.
