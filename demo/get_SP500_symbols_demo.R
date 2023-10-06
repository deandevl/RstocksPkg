library(xml2)
library(rvest)
library(data.table)
library(purrr)
library(RstocksPkg)

symbols_sp500_df <- RstocksPkg::get_SP500_symbols()
str(symbols_sp500_df)
