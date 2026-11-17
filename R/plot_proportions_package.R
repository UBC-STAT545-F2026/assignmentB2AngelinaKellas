#' Plot relative proportions of a categorical variable
#'
#' @description
#' This function calculates and plots the relative proportion of
#' observations in each category of a categorical variable.
#' It produces an error if a numeric variable is supplied.
#'
#' @param data A data frame containing the variable to be plotted.
#' @param variable An unquoted column name representing the categorical
#' variable to be plotted.
#' @param x_label A character string specifying the x-axis label.
#' @param y_label A character string specifying the y-axis label.
#'
#' @return A ggplot object displaying the relative proportion of
#' observations in each category.
#'
#' @examples
#' plot_proportions(palmerpenguins::penguins, species)
#' plot_proportions(palmerpenguins::penguins, island,
#'                  x_label = "Island",
#'                  y_label = "Relative Proportion")
#'
#' @export

plot_proportions <- function(data, variable,
                             x_label = "Category",
                             y_label = "Relative Proportion") {

  if (is.numeric(dplyr::pull(data, {{ variable }}))) {
    stop("Please provide a categorical variable, not a numeric variable.")
  }

  data |>
    dplyr::count({{ variable }}) |>
    dplyr::mutate(proportion = n / sum(n)) |>
    ggplot2::ggplot(
      ggplot2::aes(x = {{ variable }}, y = proportion)
    ) +
    ggplot2::geom_bar(stat = "identity") +
    ggplot2::coord_flip() +
    ggplot2::labs(x = x_label, y = y_label)
}
