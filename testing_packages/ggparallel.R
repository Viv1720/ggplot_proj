library(ggparallel)
#> Loading required package: ggplot2
data(mtcars)

ggparallel(list("gear", "cyl"), data=mtcars) +
  annotate(geom = "text", x = 1, y = 0, label = "test")

ggparallel(list("gear", "cyl"), data=mtcars, method="hammock", ratio=0.25) +
  geom_point()
