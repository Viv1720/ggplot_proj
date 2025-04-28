library(tidyverse)
library(dagitty)
library(ggdag)

dag <- dagitty("dag{y <- z -> x}")
tidy_dagitty(dag)

ggdag(dag, layout = "circle")

bigger_dag <- dagify(y ~ x + a + b,
                     x ~ a + b,
                     exposure = "x",
                     outcome = "y"
)

bigger_dag %>%
  node_parents("x") %>%
  ggplot(aes(x = x, y = y, xend = xend, yend = yend, color = parent)) +
  geom_dag_point() +
  geom_dag_edges() +
  geom_dag_text(col = "white") +
  theme_dag() +
  scale_color_hue(breaks = c("parent", "child")) #  ignores NA in legend
