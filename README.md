Hilite 🎨
---------

Transform source code to HTML ready for highlighting using CSS. For the moment only OCaml-related things, but it just needs the text-mate plists in `lib/syntaxes` to do other languages too. PRs welcome :) 

`tests/bin/run.t` shows the CLI in action and `tests/lib/test_md.ml` shows it in action with Markdown files. 

```sh
$ hilite --help=plain
NAME
       hilite - a command-line interface for highlighting code to HTML

SYNOPSIS
       hilite COMMAND ...

COMMANDS
       expr
           Highlight a single expression

       file
           Highlight a file containing some code

OPTIONS
       --help[=FMT] (default=auto)
           Show this help in format FMT. The value FMT must be one of `auto',
           `pager', `groff' or `plain'. With `auto', the format is `pager` or
           `plain' whenever the TERM env var is `dumb' or undefined.

```
