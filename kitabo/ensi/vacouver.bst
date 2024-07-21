ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
  }

INTEGERS { output.state before.all }

FUNCTION {format.names}
{
  's :=
  s #1 "{ff }{vv }{ll}{ jj}" format.name$
}

FUNCTION {author.format.lab}
{
  author empty$
    { "" }
    { format.names author }
  if$
}

FUNCTION {begin.bibitem}
{
  "\bibitem{" cite$ * "}" *
  newline$
  "\bibitem{" cite$ * "}" *
  newline$
}

FUNCTION {format.lab.names}
{
  's :=
  s #1 "{vv~}{ll}" format.name$
}

FUNCTION {format.authors}
{
  author empty$
    { "" }
    { author " and " format.names }
  if$
}

FUNCTION {format.title}
{
  title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {format.journal}
{
  journal "t" change.case$
}

FUNCTION {output.bibitem}
{
  begin.bibitem
  format.authors
  author format.lab.names
  author empty$ 'skip$ { ", " * } if$
  year empty$ 'skip$ { year * } if$
  journal empty$ 'skip$ { ". " * } if$
  format.title
  title empty$ 'skip$ { ". " * } if$
  journal empty$ 'skip$ { ". " * } if$
  volume empty$ 'skip$ { volume * } if$
  pages empty$ 'skip$ { ": " * pages * } if$
  note empty$ 'skip$ { ". " * note * } if$
  new.block
  "\newblock"
  newline$
  "\noindent"
  newline$
}

FUNCTION {begin.biblist}
{
  preamble$
}

FUNCTION {end.biblist}
{
  newline$
  "\end{thebibliography}"
}

ITERATE {call.type$}


