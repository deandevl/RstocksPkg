test_that("get_dow30_symbols()", {
  expect_snapshot({
    dow30_df <- RstocksPkg::get_dow30_symbols()
    head(dow30_df)
  })
})
