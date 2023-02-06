library(quantmod)
library(data.table)
library(RstocksPkg)

# ----------------------------access stock prices via quantmod from yahoo finance-----------------------------------------

# call get_stock_prices() with all the argument defaults to get a data.frame of IBM stock prices
# periodicity = "monthly" is the default
ibm_prices_dt <- RstocksPkg::get_stock_prices()
str(ibm_prices_dt)

# call get the nasdaq100 composite index using character formatted from/to and verbose output
nasdaq_prices_dt <- RstocksPkg::get_stock_prices(
  symbols = "NDX",
  from = "2022-02-02",
  to = "2023-02-02",
  verbose = TRUE
)
str(nasdaq_prices_dt)

# call RstocksPkg::get_stock_prices() with multiple symbols and 4 years of data.
ibm_hpq_dt <- RstocksPkg::get_stock_prices(
  symbols = c("IBM", "HPQ"),
  from = "2019-01-01",
  to = "2022-12-31"
)
str(ibm_hpq_dt)

# call get_stock_prices() using the defaults with multiple stock index symbols
# XYL -- Consumer Discretionary Select Sector
# XLP -- Consumer Staples Select Sector SPDR Fund
# XLE -- Energy Select Sector SPDR Fund (XLE)
# XLF -- Financial Select Sector SPDR Fund (XLF)
# XLV -- Health Care Select Sector SPDR Fund (XLV)
# XLI -- Industrial Select Sector SPDR Fund (XLI)
# XLB -- Materials Select Sector SPDR Fund (XLB)
# XLK -- Technology Select Sector SPDR Fund (XLK)
# XLU -- Utilities Select Sector SPDR Fund (XLU)
# XLRE -- The Real Estate Select Sector SPDR Fund (XLRE)
# SPY -- SPDR S&P 500 ETF Trust (SPY)
sector_tickers_v <- c("XLY", "XLP", "XLE",
                "XLF", "XLV", "XLI", "XLB",
                "XLK", "XLU", "XLRE",
                "SPY")
sector_prices_dt <- RstocksPkg::get_stock_prices(symbols = sector_tickers_v)
str(sector_prices_dt)
