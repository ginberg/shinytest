
#' @importFrom debugme debugme

.onLoad <- function(libname, pkgname) {
  debugme()

  # Make sure phantomjs library is available..
  # The executable should be available in the PATH. If it can't be found, it will be installed.
  if (is.null(suppressMessages(shinytest:::find_phantom()))) {
    webdriver::install_phantomjs()
  }
}

.onAttach <- function(libname, pkgname) {
  # Make sure phantomjs library is still available when the user attaches the package
  if (is.null(suppressMessages(shinytest:::find_phantom()))) {
    webdriver::install_phantomjs()
  }
}