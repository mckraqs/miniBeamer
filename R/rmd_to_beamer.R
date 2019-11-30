#' @title rmd_to_beamer()
#'
#' @description Converting .Rmd file into beautiful MiNI WUT themed beamer presentation
#'
#' @inheritParams rmarkdown::beamer_presentation
#' @param themecolor Sets presentation theme color (available: white, black, sapphire, graphite)
#' @param fontcolor Sets presentation font color (available: white, black, sapphire, graphite, mokka)
#' @param toc Logical indicating whether to create 'Table of Contents'
#' @param incremental Logical indicating whether to render bullet points incrementally. Defaults to FALSE. To reverse-order, precede item with `>'
#' @param fig_width Default figure width, in inches
#' @param fig_height Default figure height, in inches
#' @param fig_crop Logical whether to crop figures
#' @param fig_caption Logical indicating whether to render figure captions
#' @param keep_tex Logical indicating whether to keep .tex version of file (Recommended not switching to FALSE)
#' @param pandoc_args Optional, additional args to pass on to pandoc
#' @param highlight Highlight style, if "default" then "haddock" is used
#' @param latex_engine Indicating what LaTeX engine to use
#' @param bl Absolute path to bottomleft logo
#' @param br Absolute path to bottomright logo
#' @export
#'
#' @details Only specified pairs of themecolor and fontcolor attributes are available (see: github/mckraqs/miniBeamer)
rmd_to_beamer <- function(themecolor = 'sapphire',
                          fontcolor = 'graphite',
                          toc = FALSE,
                          incremental = FALSE,
                          fig_width = 9,
                          fig_height = 6,
                          fig_crop = TRUE,
                          fig_caption = TRUE,
                          keep_tex = TRUE,
                          pandoc_args = NULL,
                          bl = "BOTTOMLEFT",
                          br = "BOTTOMRIGHT",
                          highlight = "haddock",
                          latex_engine = "pdflatex") {

  ### Arguments validation
  check_themes(themecolor, fontcolor)

  ### Setting templates path
  template_path <- system.file("rmarkdown", "templates", "rmd_to_beamer", package = "miniBeamer")




  ### Setting required locations of document pre/suf-fixes
  doc_prefix <- file.path(template_path, "resources", "rmd_to_beamer_prefix.tex")
  doc_theme <- file.path(template_path, 'resources', 'themes', paste0(themecolor, '_', fontcolor, '.tex'))
  doc_prefix <- add_logos(doc_prefix,bl,br) ### Commenting out for now

  doc_afterbody <- file.path(template_path, "resources", "rmd_to_beamer_afterbody.tex")
  doc_prebody <- file.path(template_path, "resources", "rmd_to_beamer_beforebody.tex")
  if(toc == TRUE) {
    doc_toc <- file.path(template_path, 'resources', 'rmd_to_beamer_toc.tex')
    doc_prebody <- c(doc_prebody, doc_toc)
  }

  knitr::knit_hooks$set(mysize = function(before, options, envir) if (before) return(options$size))
  knitr::opts_chunk$set(collapse = TRUE, mysize = TRUE, size = "\\scriptsize")

  if(themecolor == 'white') {
    themecolor_rgb <- rgb(255, 255, 255, maxColorValue = 255)
  } else if(themecolor == 'black') {
    themecolor_rgb <- rgb(0, 0, 0, maxColorValue = 255)
  } else if(themecolor == 'sapphire') {
    themecolor_rgb <- rgb(120, 150, 207, maxColorValue = 255)
  } else if(themecolor == 'graphite') {
    themecolor_rgb <- rgb(60, 60, 76, maxColorValue = 255)
  } else {
    stop('Wrong theme color passed')
  }

  ### Creating a beamer === calling rmarkdown::beamerpresentation with specified parameters
  rmarkdown::beamer_presentation(
    toc = FALSE, ### ToC created with code is prettier
    incremental = incremental,
    theme = "boxes",
    colortheme = 'structure',
    latex_engine = latex_engine,
    df_print = "tibble",
    fig_crop = fig_crop,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_caption = fig_caption,
    highlight = highlight,
    keep_tex = keep_tex,
    includes = rmarkdown::includes(
      in_header = c(doc_prefix, doc_theme),
      before_body = doc_prebody,
      after_body = doc_afterbody
    ),
    pandoc_args = pandoc_args
  )
}

check_themes <- function(themecolor, fontcolor) {
  stopifnot((themecolor == 'sapphire' & (fontcolor == 'graphite' | fontcolor == 'mokka')) |
              (themecolor == 'graphite' & (fontcolor == 'white' | fontcolor == 'sapphire' | fontcolor == 'heather')) |
              (themecolor == 'white' & fontcolor == 'black') |
              (themecolor == 'black' & fontcolor == 'white'))
}


add_logos <- function(doc_prefix = NULL, bl = "BOTTOMLEFT", br = "BOTTOMRIGHT") {
  if (is.null(doc_prefix)) {
    template_path <- system.file(
      "rmarkdown", "templates", "rmd_to_beamer", package = "miniBeamer"
    )
    ## set locations of css and doc pre/suf fixes
    doc_prefix <- file.path(
      template_path, "resources", "rmd_to_beamer_prefix.tex"
    )
  }
  con <- file(doc_prefix)
  x <- readLines(con, warn = FALSE)
  close(con)

  if (bl != "BOTTOMLEFT"){
    if (file.exists(bl)) {
      gsub("^\"|^'|\"$|'$", "", bl)
      x <- gsub("BOTTOMLEFT", bl, x)
    } else {
      stop('Bottomleft logo file does not exist')
    }
  }else{
    x <- gsub("\\\\includegraphics\\[height=.8cm,keepaspectratio\\]\\{BOTTOMLEFT\\}", "{}", x)
  }

  if (br != "BOTTOMRIGHT"){
    if (file.exists(br)) {
      gsub("^\"|^'|\"$|'$", "", br)
      x <- gsub("BOTTOMRIGHT", br, x)
    } else {
      stop('Bottomright logo file does not exist')
    }
  }else{
    x <- gsub("\\\\includegraphics\\[height=.8cm,keepaspectratio\\]\\{BOTTOMRIGHT\\}", "{}", x)
  }


  ## save as temp file
  tmp <- tempfile(fileext = ".tex")
  writeLines(x, tmp)
  invisible(tmp)
}

