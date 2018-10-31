#' Install VuePress
#'
#' Download the VuePress executable with Node.js package manager.
#' You can select install path that global or specific directory.
#' @param global If `TRUE`, the VuePress install to Node.js global package path.
#' In other words, identical to `yarn global add`.
#' @param dir The directory to install VuePress.
#' @rdname install_vuepress
#' @examples
#' \dontrun{
#' install_vuepress(global = TRUE)
#' install_vuepress(dir = "project")
#' }
#' @export
install_vuepress <- function(global = FALSE, dir = ".") {

  rlang::is_false(is_installed_dependencies())

  path <-
    path2vuepress_dir(global, dir)

  if (path == "") {
    system("yarn global add vuepress")
  } else if (rlang::is_true(file.exists(path2local_vuepress(path)))) {
    rlang::inform("Already, installed vuepress")
  } else {
    system(paste("cd", path, "&& yarn add -D vuepress"))
  }
}
