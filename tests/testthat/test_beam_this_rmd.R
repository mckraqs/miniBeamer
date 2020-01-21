context("Sprawdzamy czy funkcja gituwa")

test_that("opis co testuje w tym bloku",{


ret <- "Get it from GitHub: https://github.com/mckraqs/miniBeamer"
boolek <- ret == readLines(system.file("tests/test_items", "testowe.rmd", package = "miniBeamer"))[15]

expect_true(boolek)

})

#expect_error("wyrazenie w {} np. wywlanie funkcji",NA) test czy bez bledu