(lang dune 3.8)

(name hilite)

(generate_opam_files true)

(source
 (github patricoferris/hilite))

(cram enable)

(using mdx 0.4)

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
  (mdx (and (>= 2.4.1) :with-test))
  (cmarkit (and (>= 0.3.0) :with-test))
  (textmate-language (>= 0.3.3))))
