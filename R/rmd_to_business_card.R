#' @title Create business cards
#'
#' @param template Path to HTML template used to convert .Rmd file
#'
#' @return An R Markdown output format.
#' @export
rmd_to_business_card <- function(template = pkg_resource(main_dir = 'rmarkdown/templates/rmd_to_business_card/resources', 'html', 'card.html')) {
  rmarkdown::output_format(
    list(opts_chunk = list(echo = FALSE)),
    rmarkdown::pandoc_options('html', 'markdown', args = c(
      '--template', rmarkdown::pandoc_path_arg(template),
      '--variable', 'pagetitle=Business Card'
    ))
  )
}
