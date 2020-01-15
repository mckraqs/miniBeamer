# library(miniBeamer)
# library(rmarkdown)

### Beamer generator - basic example
# rmarkdown::render('tests/rmd_to_beamer/rmd_to_beamer_example.Rmd', miniBeamer::rmd_to_beamer(toc = TRUE,
#                                                                             latex_engine = 'pdflatex'))

### Beamer generator - mid-term presentation
### NOT RUN - absolute file paths into bl and br arguments are necessary
# rmarkdown::render('tests/midterm_pres/pres.Rmd', miniBeamer::rmd_to_beamer(toc = TRUE,
#                                                                            latex_engine = 'pdflatex',
#                                                                            bl = "tests/midterm_pres/logoPW.png",
#                                                                            br = "tests/midterm_pres/logoMINI.png"))

### .Rnw to .Rmd file generator
# oldWd <- getwd()
# newWd <- paste(getwd(), "/tests/rnw_to_rmd", sep="")
# setwd(newWd)
#
# miniBeamer::rnw_to_rmd('rnwExample.Rnw')
# setwd(oldWd)

### Business card generator - basic example
# rmarkdown::render('tests/rmd_to_business_card/rmd_to_business_card_example.Rmd', miniBeamer::rmd_to_business_card())