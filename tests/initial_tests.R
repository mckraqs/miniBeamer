library(miniBeamer)
library(rmarkdown)
### While having working directory at project level
rmarkdown::render('tests/initial_test/example.Rmd', miniBeamer::beam_this_rmd(toc = TRUE,
                                                                              latex_engine = 'xelatex',
                                                                              themecolor = 'white',
                                                                              fontcolor = 'black',
                                                                              bl = "C:/Users/bgranat/Desktop/logoPW.png",
                                                                              br = "C:/Users/bgranat/Desktop/WMINIznak.png"))



### Business cards
rmarkdown::render('tests/business_card/business_card.Rmd', miniBeamer::business_card())
