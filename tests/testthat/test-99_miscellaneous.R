context("test-99_miscellaneous")

test_that("Utities", {

  expect_error(
    path2vuepress_dir(global = FALSE, "blahblahblah")
  )
  expect_equivalent(
    path2vuepress_dir(global = TRUE),
    ""
  )

  testthat::skip_if_not_installed("vpdown")
  expect_equal(
    path2vuepress_dir(global = FALSE, NULL),
    paste(find.package("vpdown"), "vuepress", sep = "/")
  )
})
