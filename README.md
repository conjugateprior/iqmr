# iqmr

IQMR slides and course materials, slowly morphing into an R package.

* `resources` contains a (free) font you may not have but will need to
  have installed to make the slides compile.

* The slides are a beamer style called `metropolis` which you'll want to install
  in your latex distro.  If you are using Mactex like a sensible person then open
  up `Tex Live Utility`, select the middle `Packages` tab, search for `metropolis` 
  packages in the search window, and right click to install it.

* To compile the slides, use XeLaTeX. `xelatex` from the command line,
  or just switch the engine in TeXShop, or whatever you use.

## TODO

* Make Bara data a corpus for quanteda
* Make election manifestos a corpus for quanteda
* Use the Bara debate html to show how to extract things from web pages

* add a wrapper function so we don't have to call them vignettes

* write conversion script for Rnw to Rmd -> DONE
* translate existing slides to Rmd -> DONE minus headers
* extract header to rmarkdown template -> after dinner


*Will Lowe 2017*