context("Testing rmd_to_beamer function")

test_that("Testing equivalency of generated files",{

  rmarkdown::render('./../test_items/rmd_to_beamer_test.rmd', miniBeamer::rmd_to_beamer(toc = TRUE, latex_engine = 'pdflatex'))
  rendered <- readLines("./../test_items/rmd_to_beamer_test.tex")
  base <- readLines("./../test_items/rmd_to_beamer_test_base.tex")

  rend_1 <- rendered[15]
  check_1 <- rend_1 == base[15]
  expect_true(check_1)

  # rend_2 <- rendered[45]
  # check_2 <- rend_2 == base[45]
  # expect_true(check_2)
  #
  # rend_3 <- rendered[70]
  # check_3 <- rend_3 == base[70]
  # expect_true(check_3)

  expect_error(rmd_to_beamer(), NA)
})