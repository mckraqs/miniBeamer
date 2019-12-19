# miniBeamer <img src="man/figures/logo.png" align="right" width="150"/>
*miniBeamer* is a R package created due to solve an university project which is related to creating beamer presentations template in *MiNI WUT* Faculty specified colours and themes. Other functionality is creating business/faculty cards perfect for sharing with other people.

## Installation

``` r
## install devtools if it's not already installed
if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")

## install miniBeamer from github
devtools::install_github("mckraqs/miniBeamer")
```

## Requirements
* [\\LaTeX](https://www.latex-project.org/get/)
* *Perl* programming language installed in case you want to convert .Rnw files
    * Version needs to be above 5.30
* University fonts installed (fonts directory)
    * Fonts can be installed but they are not implemented into this package in order to keep all latex engines compatible, so we provide them in case user would like to manually change fonts in .tex files before final compilation.

## HOW2 Section
* There are 3 main functionalities in the package. All do have complex documentation prepared inside:
    * creating beamer presentations from .Rmd files (*rmd_to_beamer()*)
    * converting .Rnw files into .Rmd (*rnw_to_rmd()*)
    * creating business/faculty cards from .Rmd files (*rmd_to_business_card()*)
* Due to functionalities development and problems encountered during it, we recommend to use .Rmd conversion at first and treat .Rnw files as a final approach
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
