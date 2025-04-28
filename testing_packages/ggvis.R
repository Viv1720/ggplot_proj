library(ggvis)
mtcars %>% ggvis(~mpg, ~wt) %>% layer_points() +
  annotate(geom = "text", x = 22, y = 3, label = "test")

class(mtcars %>% ggvis(~mpg, ~wt) %>% layer_points())
