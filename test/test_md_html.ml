let md =
  {|
```ocaml
let html = "<h1>Hello World!</h1>"
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
  let omd_t = Omd.of_string md |> Hilite.Md.transform in
  Format.printf "%s" (Omd.to_html omd_t)

let () = test_transform ()
