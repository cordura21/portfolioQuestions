#' get data for the portfolio
#'
#' @param path A path. If empty the hard coded path
#' @return The sum of \code{x} and \code{y}.
#' @examples
#' add(1, 1)
#' add(10, 1)
get_data <- function(path = NA, file_name = 'aaa') {
  if(is.na(path)){
    path <- 'asas'
  }
  #db <- readRDS(file.path(path,file_name))
  assign('db', 100, envir=baseenv())
}
