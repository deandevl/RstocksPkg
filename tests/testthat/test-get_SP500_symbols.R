test_that("get_SP500_symbols namespaces", {
  expect_true(requireNamespace("data.table", quietly = TRUE))
  expect_true(requireNamespace("xml2", quietly = TRUE))
  expect_true(requireNamespace("rvest", quietly = TRUE))
})

test_that("get_SP500_symbols()",{
  expect_snapshot({
    symbols_sp500_df <- RstocksPkg::get_SP500_symbols()
    str(symbols_sp500_df)
  })
})
