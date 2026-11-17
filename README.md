
# assignmentB2AngelinaKellas

The `assignmentB2AngelinaKellas` package provides a function for
visualizing the relative proportions of categorical variables in a
dataset. The `plot_proportions()` function calculates the proportion of
observations belonging to each category and creates a horizontal bar
plot using `ggplot2`.

This package is useful for visualizing categorical data. The function
allows for customizing axis labels and produces an error if a non
cateogrical variable is used. \## Installation

Install `assignmentB2AngelinaKellas` from GitHub using:

``` r
# install.packages("remotes")
remotes::install_github("UBC-STAT545-F2026/assignmentB2AngelinaKellas")
```

## Usage

Load the package:

``` r
library(assignmentB2AngelinaKellas)
```

The `plot_proportions()` function takes a dataset and a categorical
variable and produces a bar plot showing the relative proportion of
observations in each category.

### Example 1

``` r
library(palmerpenguins)

plot_proportions(penguins, species)
```

This example calculates and plots the relative proportions of penguin
species in the dataset.

### Example 2

You can also customize the axis labels:

``` r
plot_proportions(
  penguins,
  island,
  x_label = "Island",
  y_label = "Relative Proportion"
)
```

This example shows the relative proportions of penguin observations
across the three islands.

### Example 3

The function only accepts categorical variables. If a numeric variable
is supplied, the function produces an error:

``` r
plot_proportions(penguins, bill_length_mm)
```
