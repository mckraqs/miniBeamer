# miniBeamer
*miniBeamer* is a R package created due to solve an university project which is related to creating beamer presentations template in *MiNI WUT* Faculty specified colours and themes (not only - further info soon!).

Final product is intended to convert both *.Rmd* and *.Rnw* files into *.pdf* set of slides.

## Installation

``` r
## install devtools if it's not already installed
if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")

## install miniBeamer from github
devtools::install_github("mckraqs/miniBeamer")
```

## Requirements
* University fonts (fonts directory)
* [\\LaTeX](https://www.latex-project.org/get/) (and the `tex_engine` is `xelatex` if that matters)

## HOW2 Section

* Main presentation sections should be indicated with '#' sign (included in ToC)
* Main presentation sections subsections should be indicated with '##' sign (not included in ToC) - texts will create frames titles
* *themecolor* and *fontcolor* available connections (due to faculty restrictions) [graphics included in the nearest future]:
    * Theme: *sapphire*:
        * Font: *graphite*
        * Font: *mokka*
    * Theme: *graphite*:
        * Font: *sapphire*
        * Font: *heather*
        * Font: *white*
    * Theme: *white*
        * Font: *black*
    * Theme: *black*
        * Font: *white*

## Additional info
Main code inspiration comes from another Github repository: [*mkearney/uslides*](https://github.com/mkearney/uslides), many thanks!