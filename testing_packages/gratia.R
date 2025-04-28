library("gratia")
library("mgcv")

df <- data_sim("eg1", seed = 42)
df

m <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = df, method = "REML")
summary(m)

draw(m) +
  annotate(geom = "text", x = 0.5, y = 0, label = "test") +
  theme_minimal()

appraise(m)
