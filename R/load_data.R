#' get data for the portfolio
#'
#' @param path A path. If empty the hard coded path
#' @return nothing.
#' @examples
#' get_data(path = 'home')  gets the default data from the default place
#' get_data() ' gets data from a different place
#' get_data() ' gets data from a different place

get_data <- function(path = NA, file_name = 'aaa') {
  if(is.na(path)){
    path <- 'asas'
  }
  #db <- readRDS(file.path(path,file_name))
  assign('db', 100, envir=baseenv())
}
