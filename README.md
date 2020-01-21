<!-- badges: start -->
[![Travis build status](https://travis-ci.org/granatb/miniBeamer.svg?branch=master)](https://travis-ci.org/granatb/miniBeamer)
[![codecov](https://codecov.io/gh/granatb/miniBeamer/branch/master/graph/badge.svg)](https://codecov.io/gh/granatb/miniBeamer)
<!-- badges: end -->


# miniBeamer
*miniBeamer* is a R package created due to solve an university project which is related to creating beamer presentations template in *MiNI WUT* Faculty specified colours and themes. Other functionality is creating business/faculty cards perfect for sharing with other people.

## Installation

``` r
## install devtools if it's not already installed
if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")

## install miniBeamer from github
devtools::install_github("mckraqs/miniBeamer")
```

## Requirements
* University fonts installed (fonts directory)
* [\\LaTeX](https://www.latex-project.org/get/) (and the `tex_engine` is `pdflatex` if that matters)
   * Fonts can be installed but they are not implemented into this package in order to keep all latex engines compatible.
* *Perl* programming language installed in case you want to convert .Rnw files

## HOW2 Section

* There are 3 main functionalities in the package. All do have complex documentation prepared inside:
    * Creating beamer presentations from .Rmd files (*beam_this_rmd()*)
    * Converting .Rnw files to .Rmd (*rnw_to_rmd()*)
    * Creating business/faculty cards from .Rmd files (*business_card()*)
* Due to functionalities development we recommend to use .Rmd approach at first
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
* In order to make sure the *.Rnw* is converted correctly make sure to:
    * keep the order of: *1.* author{}, *2.* title{}, *3.* maketitle.
    * set the working directory in the folder containing the .Rnw file
* Business/Faculty cards functionality possible attributes:
    * name (bolded)
    * title (bolded)
    * phone
    * email
    * url
    * address

## Additional info
Main code inspiration comes from another Github repositories: [*mkearney/uslides*](https://github.com/mkearney/uslides) (beamers), [*rstudio/pagedown*](https://github.com/rstudio/pagedown) (business/faculty cards) and
[*mikelove/convert.txt*](https://gist.github.com/mikelove/5618f935ace6e389d3fbac03224860cd) (.Rnw conversion),
many thanks!

## Package authors:
[mckraqs](https://github.com/mckraqs), [granatb](https://github.com/granatb), [Adamoso](https://github.com/Adamoso), [witoldmerkel](https://github.com/witoldmerkel), [michalSt98](https://github.com/michalSt98)
