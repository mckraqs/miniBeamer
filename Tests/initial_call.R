library(miniBeamer)
library(rmarkdown)
### While having working directory at project level
rmarkdown::render('tools/readme/example.Rmd', uslides_pdf(toc = FALSE))
# rmarkdown::render('tools/readme/example.Rmd', miniBeamer::uslides_html())
