library(GGally)

# Prepare some data
df <- mtcars[, c(1,3,4,5,6,7)]
# Correlation plot
ggcorr(df, palette = "RdBu", label = TRUE) +
  geom_point()

# From the help page:
data(flea)
ggpairs(flea, columns = 2:4, ggplot2::aes(colour=species))

data(tips, package = "reshape")
p <- ggpairs(
  tips[, c(1, 3, 4, 2)],
  upper = list(continuous = "density", combo = "box_no_facet"),
  lower = list(continuous = "points", combo = "dot_no_facet")
)

class(p)

p + gg
