context("test-01_runtime")

test_that("Exist Dependencies Systems", {

  expect_true(
    is_installed_dependencies()
  )
})
