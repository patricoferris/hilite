(lang dune 2.9)

(name hilite)

(generate_opam_files true)

(source
 (github patricoferris/hilite))

(cram enable)

(using mdx 0.1)

(license ISC)

(authors "Patrick Ferris")

(maintainers "patrick@sirref.org")

(package
 (name hilite)
 (synopsis "Build time syntax highlighting")
 (tags ("syntax" "highlighting"))
 (description
  "A library for adding syntax highlighting to OCaml-related code and outputing to HTML")
 (depends
  (mdx :with-test)
  cmarkit
  (textmate-language (>= 0.3.3))))
