# get_SP500_symbols()

    Code
      symbols_sp500_df <- RstocksPkg::get_SP500_symbols()
      str(symbols_sp500_df)
    Output
      Classes 'data.table' and 'data.frame':	503 obs. of  3 variables:
       $ Symbol     : chr  "MMM" "AOS" "ABT" "ABBV" ...
       $ Security   : chr  "3M" "A. O. Smith" "Abbott Laboratories" "AbbVie" ...
       $ GICS_Sector: chr  "Industrials" "Industrials" "Health Care" "Health Care" ...
       - attr(*, ".internal.selfref")=<externalptr> 

