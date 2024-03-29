A diff block!

```patch
-  module Sel = (val if is_osx () then (module Mac)
-                    else if Sys.unix then (module Unix)
-                    else (module Fail) : Unix_socket)
+  module Sel =
+    (val if is_osx () then (module Mac)
+         else if Sys.unix then (module Unix)
+         else (module Fail)
+        : Unix_socket)
```