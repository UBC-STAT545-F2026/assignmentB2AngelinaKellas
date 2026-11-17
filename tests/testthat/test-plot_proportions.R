
test_that("plot_proportions works correctly", {

  #test 1: does the function produce a ggplot?
  expect_s3_class(
    plot_proportions(palmerpenguins::penguins, species),
    "ggplot"
  )

  #test 2: does the function let you customize axis labels?
  expect_equal(
    plot_proportions(
      palmerpenguins::penguins,
      species,
      x_label = "Penguin Species",
      y_label = "Proportion"
    )$labels$x,
    "Penguin Species"
  )

  #test 3 does the function error for numeric variables?
  expect_error(
    plot_proportions(
      palmerpenguins::penguins,
      bill_length_mm
    )
  )

})
