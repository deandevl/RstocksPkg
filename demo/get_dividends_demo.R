library(quantmod)
library(data.table)
library(RstocksPkg)

# ----------------------------access dividends via quantmod-----------------------------------------

# call get_dividends() with all the argument defaults to get a data.frame of IBM dividends
#
ibm_dividends_dt <- RstocksPkg::get_dividends()
head(ibm_dividends_lst)

# call get_dividends() with 2 stocks, a time frame, and pad the Date column
ibm_apple_dividends_dt <- RstocksPkg::get_dividends(
  symbols = c("IBM","AAPL"),
  from = "2000-01-01",
  to = "2022-12-31",
  pad_by_month = TRUE
)
head(ibm_apple_dividends_dt)
