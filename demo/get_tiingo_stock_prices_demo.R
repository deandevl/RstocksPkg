library(quantmod)
library(data.table)
library(RstocksPkg)

# ----------------------------access stock prices via quantmod from tiingo finance-----------------------------------------

# read the Tiingo api key
api_key <- RstocksPkg::read_tiingo_key()

# call get_stock_prices() with all the argument defaults to get a data.frame of IBM stock prices
# source = "tiingo"
# periodicity = "monthly" is the default
ibm_prices_dt <- RstocksPkg::get_stock_prices(
  source = "tiingo",
  api_key = api_key
)
str(ibm_prices_dt)


# call RstocksPkg::get_stock_prices() with multiple symbols and 10 years of annual data.
# source = "tiingo"
# periodicity = "annually"
ibm_hpq_dt <- RstocksPkg::get_stock_prices(
  source = "tiingo",
  api_key = api_key,
  symbols = c("IBM", "HPQ"),
  from = "2013-01-01",
  to = "2022-12-31",
  periodicity = "annually"
)
str(ibm_hpq_dt)
