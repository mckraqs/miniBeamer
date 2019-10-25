# miniBeamer

*miniBeamer* is a R package created due to solve an university project which is related to creating beamer presentations template in *MiNI WUT* Faculty specified colours and themes (not only - further info soon!).

Final product is intended to convert both *.Rmd* and *.Rnw* files into *.pdf* set of slides.

---

## Installation

``` r
## install devtools if it's not already installed
if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")

## install uslides from github
devtools::install_github("mckraqs/miniBeamer")
```

---

## Requirements
* University fonts (fonts directory)
* [\\LaTeX](https://www.latex-project.org/get/) (and the `tex_engine` is `xelatex` if that matters)

---

## Additional info

Main code inspiration comes from another Github repository: [*mkearney/uslides*](https://github.com/mkearney/uslides), many thanks!