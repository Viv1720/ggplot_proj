library("ggfortify")

df <- mtcars[, c("mpg", "disp", "hp", "drat", "wt")]
df <- as.matrix(df)

# Heatmap
autoplot(scale(df))

# Extract the data
df2 <- df[, c("wt", "mpg")]
colnames(df2) <- c("V1", "V2")
# Scatter plot
autoplot(df2, geom = 'point') +
  labs(x = "mpg", y = "wt")

# Compute a linear model
m <- lm(Petal.Width ~ Petal.Length, data = iris)
# Create the plot
autoplot(m, which = 1:6, label.size = 3, data = iris,
         colour = 'Species')

# Compute a generalized linear model
m2 <- glm(Murder ~ Assault + UrbanPop + Rape,
         family = gaussian, data = USArrests)
# Create the plot
# Change the theme and colour
autoplot(m2, which = 1:6, ncol = 2, label.size = 3,
         colour = "steelblue") + theme_bw()
