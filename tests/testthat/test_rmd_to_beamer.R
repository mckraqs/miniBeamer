context("Sprawdzamy czy funkcja rmd_to_beamer gituwa")

test_that("Testuje zgodnosc plikow generowanych przez funkcje",{

  rmarkdown::render('./../test_items/testowe_new.rmd', miniBeamer::rmd_to_beamer(toc = TRUE, latex_engine = 'pdflatex'))

  ret <- readLines("./../test_items/testowe_new.tex")[15]
  boolek <- ret == readLines("./../test_items/testowe.tex")[15]

  expect_true(boolek)

  ret <- readLines("./../test_items/testowe_new.tex")[45]
  boolek <- ret == readLines("./../test_items/testowe.tex")[45]

  expect_true(boolek)

  ret <- readLines("./../test_items/testowe_new.tex")[70]
  boolek <- ret == readLines("./../test_items/testowe.tex")[70]

  expect_true(boolek)

  expect_error(rmd_to_beamer() ,NA)


})
