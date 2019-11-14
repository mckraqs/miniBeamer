library(miniBeamer)
library(rmarkdown)

rmarkdown::render('tests/rmd_beamer/example.Rmd', miniBeamer::beam_this_rmd(toc = TRUE,
                                                                            latex_engine = 'pdflatex'))

### .Rmd to .pdf
rmarkdown::render('tests/prezentacja/prezentacja_pakietu.Rmd', miniBeamer::beam_this_rmd(toc = TRUE,
                                                                                         latex_engine = 'pdflatex',
                                                                                         bl = "C:/Users/bgranat001/Documents/GitHub/miniBeamer/tests/prezentacja/logoPW.png",
                                                                                         br = "C:/Users/bgranat001/Documents/GitHub/miniBeamer/tests/prezentacja/logoMINI.png"))

### .Rnw to .Rmd
## In order for the conversion to work properly the working directory
## has to be in the folder containing the .Rnw file.
oldWd <- getwd()
newWd <- paste(getwd(), "/tests/rnw_to_rmd", sep="")
setwd(newWd)

miniBeamer::rnw_to_rmd('rnwExample.Rnw')
rmarkdown::render('rnwExample.Rmd', miniBeamer::beam_this_rmd(toc = TRUE,
                                                                        latex_engine = 'pdflatex',
                                                                        themecolor = 'sapphire',
                                                                        fontcolor = 'graphite',
                                                                        bl = "C:/Users/Adam/Desktop/logoPW.jpg",
                                                                        br = "C:/Users/Adam/Desktop/logoMini.png"))

setwd(oldWd)

### Business card generator
rmarkdown::render('tests/business_card/business_card.Rmd', miniBeamer::business_card())

