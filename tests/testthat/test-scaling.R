
# Source necessary files for standalone testing via Rscript
if (file.exists("R/scaling.R")) source("R/scaling.R")

test_that("et_scale_generate produces correct frequencies", {
  scale <- et_scale_generate(period = 2, divisions = 12)
  expect_equal(nrow(scale), 13)
  expect_equal(scale$ratio_cents[1], 0)
  expect_equal(scale$ratio_cents[13], 1200)
})

test_that("et_scale_named produces correct structure", {
  names <- c("C", "D", "E")
  scale <- et_scale_named(note_names = names, period = 2)
  expect_equal(nrow(scale), 4)
  expect_equal(scale$note_name[1], "C")
})

test_that("interval_table generates expected number of intervals", {
  scale <- et_scale_generate(period = 2, divisions = 12)
  ints <- interval_table(scale)
  expect_equal(nrow(ints), 78)
})
