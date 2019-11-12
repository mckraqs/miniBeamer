library(miniBeamer)
library(rmarkdown)

### .Rmd to .pdf
rmarkdown::render('tests/prezentacja/prezentacja_pakietu.Rmd', miniBeamer::beam_this_rmd(toc = TRUE,
                                                                              latex_engine = 'xelatex',
                                                                              themecolor = 'white',
                                                                              fontcolor = 'black',
                                                                              bl = "C:/Users/bgranat/Desktop/logoPW.png",
                                                                              br = "C:/Users/bgranat/Desktop/WMINIznak.png"))

### .Rnw to .rmd
miniBeamer::rnw_to_rmd('tests/rnw_to_rmd/rnwExample.Rnw')

### Business card generator
rmarkdown::render('tests/business_card/business_card.Rmd', miniBeamer::business_card())
