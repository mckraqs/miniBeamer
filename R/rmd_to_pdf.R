#' @title beam_this_rmd()
#' @details .Rmd file into beautiful MiNI WUT themed beamer presentation
#'
#' @inheritParams rmarkdown::beamer_presentation
#' @export
beam_this_rmd <- function(toc = FALSE,
                            incremental = FALSE,
                            fig_width = 9,
                            fig_height = 6,
                            fig_crop = TRUE,
                            fig_caption = TRUE,
                            keep_tex = FALSE,
                            pandoc_args = NULL,
                            highlight = "haddock",
                            latex_engine = "xelatex") {

  ### Setting templates path
  template_path <- system.file("rmarkdown", "templates", "rmd_to_pdf", package = "miniBeamer")

  ### Setting required locations of document pre/suf-fixes
  doc_prefix <- file.path(template_path, "resources", "rmd_to_pdf_prefix.tex")
  # doc_prefix <- add_logos(doc_prefix) ### Commenting out for now

  doc_afterbody <- file.path(template_path, "resources", "rmd_to_pdf_afterbody.tex")
  doc_prebody <- file.path(template_path, "resources", "rmd_to_pdf_beforebody.tex")

  knitr::knit_hooks$set(mysize = function(before, options, envir) if (before) return(options$size))
  knitr::opts_chunk$set(collapse = TRUE, mysize = TRUE, size = "\\scriptsize")

  ### Creating a beamer === calling rmarkdown::beamerpresentation with specified parameters
  rmarkdown::beamer_presentation(
    toc = toc,
    incremental = incremental,
    theme = "boxes",
    colortheme = "structure",
    latex_engine = latex_engine,
    df_print = "tibble",
    fig_crop = fig_crop,
    fig_width = fig_width,
    fig_height = fig_height,
    fig_caption = fig_caption,
    highlight = highlight,
    keep_tex = keep_tex,
    includes = rmarkdown::includes(
      in_header = doc_prefix,
      before_body = doc_prebody,
      after_body = doc_afterbody
    ),
    pandoc_args = pandoc_args
  )
}