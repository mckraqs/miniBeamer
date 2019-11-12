#' @title rnw_to_rmd()
#' @description Converting .Rnw file into .Rmd
#' @param filename String that indicates the location and name of the .Rnw file to be converted.
#' @export

rnw_to_rmd <- function(filename){
  outputname <- gsub('.{3}$', '', filename)
  outputname <- paste(outputname, "Rmd", sep="")

  main_pl <- system.file("pl","rnwConverter.pl",package = "miniBeamer")
  arg1 <- paste(filename," > ",outputname,sep="")
  cmd <- paste0("perl ",main_pl, " ", arg1)
  readr::write_lines(system(cmd, intern = TRUE), outputname)
}