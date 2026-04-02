let md =
  {|
```ocaml
let html = "<h1>Hello World!</h1>"
```

 - ```ocaml
   let indented_code_block f = f
   ```

```diff
-  module Sel = (val if is_osx () then (module Mac)
-                    else if Sys.unix then (module Unix)
-                    else (module Fail) : Unix_socket)
+  module Sel =
+    (val if is_osx () then (module Mac)
+         else if Sys.unix then (module Unix)
+         else (module Fail)
+        : Unix_socket)
```
|}

let test_transform () =
  let omd_t = Cmarkit.Doc.of_string md |> Hilite_markdown.transform in
  Format.printf "%s" (Cmarkit_html.of_doc ~safe:false omd_t)

let () = test_transform ()
