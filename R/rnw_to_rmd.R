#' @title rnw_to_rmd()
#' @description Converting .Rnw file into .Rmd
#' @param filename String that indicates the location and name of the .Rnw file to be converted.
#' @export
#' @importFrom readr write_lines
#' @importFrom stringr str_match
#'
#' @details In order for the conversion to work properly the working directory has to be in the folder containing the .Rnw file.

rnw_to_rmd <- function(filename){
  outputname <- gsub('.{3}$', '', filename)
  outputname <- paste(outputname, "Rmd", sep="")
  perl.installed <- system('perl -v')==0
  if(perl.installed==TRUE){
    perl.version <- system("perl -v", intern = TRUE)
    perlVer <- str_match(perl.version[2],"perl\\D*(\\d+)")[1,2]
    perlSubver <- str_match(perl.version[2],"version\\D*(\\d+)")[1,2]
    if(perlVer!="5" || perlSubver!="30"){
      cat("Your Perl version is outdated, the conversion might not function properly!\n")
    }

    main_pl <- system.file("pl","rnwConverter.pl",package = "miniBeamer")
    arg1 <- paste(filename," > ",outputname,sep="")
    cmd <- paste0("perl ",main_pl, " ", arg1)
    write_lines(system(cmd, intern = TRUE), outputname)
  }
  else{
    cat("You need Perl installed to use this function!\n")
    userOS <- Sys.info()['sysname']
    if(userOS == "Windows"){
      winVersion <- str_match(Sys.info()['release'], "x\\D*(\\d+)")[1,2]
      cat("Please visit the following link to download Strawberry Perl v5.30:\n")
      if(winVersion=="64"){
        cat("http://strawberryperl.com/download/5.30.1.1/strawberry-perl-5.30.1.1-64bit.msi\n")
      }
      if(winVersion=="32"){
        cat("http://strawberryperl.com/download/5.30.1.1/strawberry-perl-5.30.1.1-32bit.msi\n")
      }
    }
    else{
      if(askYesNo(msg = "Do you wish to install Perl now?\n")==TRUE){
        autoInstall <- system('curl -L http://xrl.us/installperlnix | bash')
        perl.installed <- system('perl -v')==0
        if(perl.installed == FALSE){
          cat("Please visit the following link to download Active Perl v5.30:\n")
          cat("https://www.perl.org/get.html\n")
        }
      }
    }
  }
}