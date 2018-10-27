is_installed_dependencies <- function() {
  if (sum(nchar(Sys.which("npm")),
          nchar(Sys.which("yarn"))) == 0) {
    rlang::inform("Please install Node.js package manager which npm or yarn.")
    FALSE
  } else {
    TRUE
  }
}

path2vuepress_dir <- function(global = FALSE, path = NULL) {

  if (rlang::is_true(global)) {
    Sys.which("vuepress")
  } else if (rlang::is_false(global) && rlang::is_null(path)) {
    paste(find.package(package = "vpdown"), "vuepress", sep = "/")
  } else {
    if (rlang::is_false(dir.exists(path)))
      rlang::abort("Does not exist directory")

    path
  }
}

path2local_vuepress <- function(path) {
  paste(path,
        "node_modules/vuepress/vuepress.js",
        sep = "/")
}
