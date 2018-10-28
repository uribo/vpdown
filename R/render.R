#' Render multiple R Markdown files convert to Markdown
#'
#' @param input_dir Directory that target
#' R Markdown to convert into Markdown.
#' @rdname render_site
#' @examples
#' \dontrun{
#' render_site("project")
#' }
#' @export
render_site <- function(input_dir = ".") {
  target_rmd <-
    list.files(path = input_dir,
               pattern = "Rmd",
               full.names = TRUE)
  Map(knit_to_md,
      file = target_rmd)
}

knit_to_md <- function(file) {

  filename <-
    tools::file_path_sans_ext(basename(file))

  knitr::knit(
    here::here(file),
    output = here::here("docs",
                        paste0(filename,
                               ".md")))
}
