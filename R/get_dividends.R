#' Get stock market dividends via quantmod
#'
#' A wrapper around quantmod::getDividends()) for returning a data table of historic dividends.
#'
#' @param symbols A character vector of stock market symbols to be accessed.
#' @param from A Date or string object that sets the starting date in YYYY-MM-DD ISO format.
#' @param to A Date or string object that sets the ending date in YYYY-MM-DD ISO format.
#' @param verbose A logical which if TRUE will output in verbose.
#' @param warnings A logical which if TRUE shows warnings.
#' @param pad_by_month A logical which if TRUE will pad the Date column with months having
#'   dividend values of zero.
#'
#' @return A data table with historic "Date"'s along with dividend related variables.
#'
#' @author Rick Dean
#'
#' @importFrom quantmod getDividends
#' @importFrom data.table as.data.table
#' @importFrom data.table setnames
#' @importFrom padr thicken
#' @importFrom padr pad
#'
#' @export
get_dividends <- function(
    symbols = "IBM",
    from = as.Date("1970-01-01"),
    to = as.Date("2022-12-31"),
    verbose = FALSE,
    warnings = TRUE,
    pad_by_month = FALSE
){
  if(is.character(from)){
    from <- as.Date(from)
  }
  if(is.character(to)){
    to <- as.Date(to)
  }
  master_dt <- NULL

  for(idx in seq(length(symbols))){
    Symbol = symbols[[idx]]

    result <- quantmod::getDividends(
      Symbol = Symbol,
      verbose = verbose,
      from = from,
      to = to,
      warnings = warnings
    )
    if(is.list(result)){
      return(result)
    }else{
      temp_dt <- data.table::as.data.table(result)
      temp_dt <- cbind(Symbol, temp_dt)
      data.table::setnames(temp_dt, old = 2:3, new = c("Date","Dividend"))
      master_dt = rbind(master_dt, temp_dt)
    }
  }

  if(pad_by_month){
    master_dt <- padr::thicken(
      master_dt,
      interval = "month",
      by = "Date"
    )

    master_dt <- padr::pad(
      master_dt,
      interval = "month",
      by = "Date_month",
      group = "Symbol"
    )
    data.table::setnafill(master_dt, fill = 0, cols = "Dividend")
    master_dt[, Date := NULL]
    data.table::setnames(master_dt, old = 3, new = "Date")
  }
  return(master_dt)
}
