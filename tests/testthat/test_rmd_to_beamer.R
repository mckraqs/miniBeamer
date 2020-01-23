context("Testing rmd_to_beamer function")

test_that("Testing equivalency of generated files",{

  rmarkdown::render('./../test_items/rmd_to_beamer_test.rmd', miniBeamer::rmd_to_beamer(toc = TRUE, latex_engine = 'pdflatex'))
  rendered <- readLines("./../test_items/rmd_to_beamer_test.tex")
  base <- readLines("./../test_items/rmd_to_beamer_test_base.tex")

  rend_1 <- rendered[15]
  check_1 <- rend_1 == base[15]
  expect_true(check_1)

  expect_error(rmd_to_beamer(), NA)
})