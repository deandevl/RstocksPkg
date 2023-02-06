#' Get stock market prices via quantmod
#'
#' A wrapper around quantmod::getSymbols()) for returning a data table of historic stock prices.
#'
#' @param symbols A character vector of stock market symbols to be accessed.
#' @param periodicity A string that defines the frequency of sampled prices. Acceptable values are "daily",
#'  "weekly", "monthly".
#' @param from A Date or string object that sets the starting date in YYYY-MM-DD ISO format. For \code{source}
#'   equal to "tiingo", no sooner than "2007-01-01".
#' @param to A Date or string object that sets the ending date in YYYY-MM-DD ISO format.
#' @param verbose A logical which if TRUE will output in verbose.
#' @param source A string that sets the source for the data. Acceptable values are "yahoo" (default) or
#'   "tiingo". If "tiingo" is selected then \code{periodicity} also has "annually".
#' @param api_key If "tiingo" is selected for \code{source}, then the api key issued by Tiingo is required.
#' @param warnings A logical which if TRUE shows warnings.
#'
#' @return A data table with historic "Date"'s along with stock price related variables.
#'
#' @author Rick Dean
#'
#' @importFrom quantmod getSymbols
#' @importFrom data.table as.data.table
#' @importFrom data.table setnames
#'
#' @export
get_stock_prices <- function(
  symbols = "IBM",
  periodicity = "monthly",
  from = as.Date("2022-01-01"),
  to = as.Date("2022-12-31"),
  verbose = FALSE,
  source = "yahoo",
  api_key = NULL,
  warnings = TRUE
  ){
    `%nin%` = Negate(`%in%`)
    if(periodicity %nin% c("daily", "weekly", "monthly", "annually")){
      stop("Acceptable values for periodicity are 'daily', 'weekly', 'monthly', 'annually'(tiingo)")
    }
    if(source %nin% c("yahoo", "tiingo")){
      stop("Acceptable values for source are 'yahoo', 'tiingo'")
    }
    if(source == "tiingo" & is.null(api_key)){
      stop("An api key is required from Tiingo.")
    }

    if(is.character(from)){
      from <- as.Date(from)
    }
    if(is.character(to)){
      to <- as.Date(to)
    }
    master_dt <- NULL
    temp_dt <- NULL

    for(idx in seq(length(symbols))){
      Symbol = symbols[[idx]]
      quantmod::getSymbols(
        Symbol,
        periodicity = periodicity,
        src = source,
        verbose = verbose,
        warnings = warnings,
        api.key = api_key,
        from = from,
        to = to
      )

      temp_dt <- data.table::as.data.table(get(Symbol))
      temp_dt <- cbind(Symbol, temp_dt)
      data.table::setnames(temp_dt, old = 2:8, new = c("Date","Open","High","Low","Close","Volume","Adjusted"))
      master_dt = rbind(master_dt, temp_dt)
    }

    return(master_dt)
}
