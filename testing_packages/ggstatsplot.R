library(ggstatsplot)
set.seed(123)

ggbetweenstats(
  data  = iris,
  x     = Species,
  y     = Sepal.Length,
  title = "Distribution of sepal length across Iris species"
)

gghistostats(
  data       = ggplot2::msleep,
  x          = awake,
  title      = "Amount of time spent awake",
  test.value = 12,
  binwidth   = 1
)

grouped_ggdotplotstats(
  data            = dplyr::filter(ggplot2::mpg, cyl %in% c("4", "6")),
  x               = cty,
  y               = manufacturer,
  type            = "bayes",
  xlab            = "city miles per gallon",
  ylab            = "car manufacturer",
  grouping.var    = cyl,
  test.value      = 15.5,
  point.args      = list(color = "red", size = 5, shape = 13),
  annotation.args = list(title = "Fuel economy data")
) + geom_point()
