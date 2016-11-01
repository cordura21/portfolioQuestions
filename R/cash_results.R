#' Get cash movements that causes pnl
#'
#' @param by_day do you want to see each day?
#' @return A list of all cash records that have a pnl
#' @examples


cash_results <- function(by_day = FALSE){
  carteras_local <- as.character(port$carteras$CarteraNom)
  return(
  db$b %>% filter(AT13 == 'Cash', CarteraNom %in% carteras_local) %>%
    mutate(group_date = fecha) %>%
    group_by(group_date,CarteraNom,EspecieNombre) %>%
    summarise(pnl = sum(Resultado)) %>%
    filter(pnl != 0) %>%
    arrange(desc(abs(pnl)))
  )
}
