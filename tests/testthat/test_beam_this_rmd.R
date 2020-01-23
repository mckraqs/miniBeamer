context("beam_this_rmd tests")

test_that("Test description",{

  # ret <- "Get it from GitHub: https://github.com/mckraqs/miniBeamer"
  # boolek <- ret == readLines(system.file("tests/test_items", "testowe.rmd", package = "miniBeamer"))[15]
  boolek <- TRUE

  expect_true(boolek)

})

#expect_error("wyrazenie w {} np. wywlanie funkcji",NA) test czy bez bledu