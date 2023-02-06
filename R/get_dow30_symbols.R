#' Get ticker symbols for "DOW 30" stocks that comprise the DOW
#'   Jones Industrial Average
#'
#' Returns a data frame with character strings of ticker symbols
#'   for 30 of the stock market's top blue chip companies("ticker").
#'   Also a column that names the company ("company").
#' @return A data frame of ticker symbols and their company names.
#'
#' @author Rick Dean
#'
#' @export
get_dow30_symbols <- function(){
  return(
    data.frame(
      ticker = c("AAPL","AMGN","AXP","BA","CAT","CRM",
                 "CSCO","CVX","DIS","DOW","GS","HD",
                 "IBM","INTC","JNJ","JPM","KO","MCD",
                 "MMM","MRK","MSFT","NKE","PG","TRV",
                 "UNH","V","VZ","WMT"),
      company = c("Apple","AMGEN","Amer Express","Boeing","Caterpillar","Salesforce",
                  "Cisco Sys","Chevron","Walt Disney","DOW","Goldman Sachs","Home Depot",
                  "IBM","Intel","Johnson & Johnson","JPMorgan Chase","Coca-Cola","McDonalds",
                  "3M","Merck & Co.","Microsoft","Nike","Procter & Gamble","Travelers Co.",
                  "UnitedHealth Group","Visa","Verizon Comm.","Walmart")
    )
  )
}
