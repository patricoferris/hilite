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
# Omd.of_string md |> Hilite.Md.transform |> Omd.to_html;;
- : string =
"<p>&quot;Hello World!&quot; in OCaml looks like:</p>\n<pre><code><span class='ocaml-keyword-other'>let</span><span class='ocaml-source'> </span><span class='ocaml-constant-language'>()</span><span class='ocaml-source'> </span><span class='ocaml-keyword-operator'>=</span><span class='ocaml-source'> <"... (* string length 593; truncated *)
```
