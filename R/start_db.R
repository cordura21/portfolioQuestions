#' get data for the portfolio
#'
#' @param path A path. If empty the hard coded path
#' @return nothing.
#' @examples
#' get_data(path = 'home')  gets the default data from the default place
#' get_data() ' gets data from a different place
#' get_data() ' gets data from a different place

get_os <- function(){
  sysinf <- Sys.info()
  if (!is.null(sysinf)){
    os <- sysinf['sysname']
    if (os == 'Darwin')
      os <- "osx"
  } else { ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os))
      os <- "osx"
    if (grepl("linux-gnu", R.version$os))
      os <- "linux"
  }
  tolower(os)
}


start_db <- function(path = NA) {
  default_path <- NA
  default_path <- ifelse(get_os() == 'Windows',
                         'windows_path_here',NA)
  default_path <- ifelse(get_os() == 'osx',
                         '/Volumes/RiskApps/data',NA)

  if(is.na(path)){
    path <- default_path
  }
  db <- list()
  db$b <- readRDS(file.path(path,'bulk_nuevo.RDS')) %>% tbl_df() %>%
    mutate(fecha = Periodo, Periodo = NULL)

  db$p <- readRDS(file.path(path,'pnl.RDS')) %>% tbl_df()
  db$f <- readRDS(file.path(path,'familias.RDS')) %>% tbl_df()
  db$date <- max(db$p$Fecha)

  assign('db', db, envir=baseenv())
  set_portfolio('TOTAL T+ L')
  last_returns()


}
