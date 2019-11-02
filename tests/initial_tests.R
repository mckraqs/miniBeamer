library(miniBeamer)
library(rmarkdown)
### While having working directory at project level
rmarkdown::render('tests/initial_test/example.Rmd', miniBeamer::beam_this_rmd(toc = TRUE,
                                                                              latex_engine = 'pdflatex',
                                                                              themecolor = 'graphite',
                                                                              fontcolor = 'heather'))



### Business cards
rmarkdown::render('tests/business_card/business_card.Rmd', miniBeamer::business_card())
