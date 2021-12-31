<!--
Add here global page variables to use throughout your
website.
The website_* must be defined for the RSS to work
-->
@def website_title = "Julia Smooth Optimizers"
@def website_descr = "Julia Smooth Optimizers docs"
@def website_url   = "https://jso-docs.github.io/tutorial-template"

@def author = "Abel Soares Siqueira"

@def mintoclevel = 2
@def prepath     = get(ENV, "PREVIEW_FRANKLIN_PREPATH", "tutorial-template") # In the third argument put the prepath you normally use
@def website_url = get(ENV, "PREVIEW_FRANKLIN_WEBSITE_URL", "jso-docs.github.io") # Just put the website name

<!--
Add here files or directories that should be ignored by Franklin, otherwise
these files might be copied and, if markdown, processed by Franklin which
you might not want. Indicate directories by ending the name with a `/`.
-->
@def ignore = ["node_modules/", "franklin", "franklin.pub"]

<!--
Add here global latex commands to use throughout your
pages. It can be math commands but does not need to be.
For instance:
* \newcommand{\phrase}{This is a long phrase to copy.}
-->
\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}
\newcommand{\preamble}[1]{
  # {{ title }}

  @@author
  by #1
  @@

  {{ list_versions }}
}