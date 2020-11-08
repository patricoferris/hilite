Highlight single expression on the command line

  $ hilite expr ocaml "fun x -> x + 1"
  <pre><code><span class="ocaml-keyword">fun</span><span class="ocaml-source"> </span><span class="ocaml-source">x</span><span class="ocaml-source"> </span><span class="ocaml-keyword-operator">-&gt;</span><span class="ocaml-source"> </span><span class="ocaml-source">x</span><span class="ocaml-source"> </span><span class="ocaml-keyword-operator">+</span><span class="ocaml-source"> </span><span class="ocaml-constant-numeric">1</span><span class="ocaml-source">
  </span></code></pre>

Highlight something from a source file 

  $ hilite file ocaml test.ml
  <pre><code><span class="ocaml-keyword">let </span><span class="ocaml-entity-name">is_empty</span><span class="ocaml-source"> </span><span class="ocaml-keyword-operator">=</span><span class="ocaml-source"> </span><span class="ocaml-keyword">function</span><span class="ocaml-source"> </span><span class="ocaml-constant-language">[]</span><span class="ocaml-source"> </span><span class="ocaml-keyword-operator">-&gt;</span><span class="ocaml-source"> </span><span class="ocaml-constant-language">true</span><span class="ocaml-source"> </span><span class="ocaml-keyword">|</span><span class="ocaml-source"> </span><span class="ocaml-constant-language">_</span><span class="ocaml-source"> </span><span class="ocaml-keyword-operator">-&gt;</span><span class="ocaml-source"> </span><span class="ocaml-constant-language">false</span><span class="ocaml-source">
  </span></code></pre>
