library(RstocksPkg)
library(RplotterPkg)

dow30_df <- RstocksPkg::get_dow30_symbols()

RplotterPkg::create_table(
  x = dow30_df,
  container_width_px = 400
)
