# library(miniBeamer)
# library(rmarkdown)

### Beamer generator - basic example
# rmarkdown::render('tests/rmd_to_beamer/rmd_to_beamer_example.Rmd', miniBeamer::rmd_to_beamer(toc = TRUE,
#                                                                             latex_engine = 'pdflatex'))

### Beamer generator - mid-term presentation
### NOT RUN - absolute file paths into bl and br arguments are necessary
# rmarkdown::render('tests/midterm_presentation/prezentacja_pakietu.Rmd', miniBeamer::rmd_to_beamer(toc = TRUE,
#                                                                                          latex_engine = 'pdflatex',
#                                                                                          bl = "tests/midterm_presentation/logoPW.png",
#                                                                                          br = "tests/midterm_presentation/logoMINI.png"))

### .Rnw to .Rmd file generator
## In order for the conversion to work properly the working directory
## has to be in the folder containing the .Rnw file.
# oldWd <- getwd()
# newWd <- paste(getwd(), "/tests/rnw_to_rmd", sep="")
# setwd(newWd)
#
# miniBeamer::rnw_to_rmd('rnwExample.Rnw')
# rmarkdown::render('rnwExample.Rmd', miniBeamer::beam_this_rmd(toc = TRUE,
#                                                                         latex_engine = 'pdflatex',
#                                                                         themecolor = 'sapphire',
#                                                                         fontcolor = 'graphite',
#                                                                         bl = "C:/Users/Adam/Desktop/logoPW.jpg",
#                                                                         br = "C:/Users/Adam/Desktop/logoMini.png"))
# setwd(oldWd)

### Business card generator - basic example
# rmarkdown::render('tests/rmd_to_business_card/rmd_to_business_card_example.Rmd', miniBeamer::rmd_to_business_card())

