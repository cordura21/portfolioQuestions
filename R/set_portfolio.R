set_portfolio <- function(familia){
  port <- list()
  port$name <- familia
  port$carteras <- db$f %>% filter(Descripcion == familia) %>%
    select(CarteraNom)
  assign('port', port, envir=baseenv())
}
