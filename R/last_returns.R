last_returns <- function(){
  return(t(
    db$p %>% filter(Fecha == db$date, NombreFamilia == port$name)
  ))
}
