library(waterfalls)

group <- LETTERS[1:6]
value <- c(2000, 4000, 2000,
           -1500, -1000, -2500)
df <- data.frame(x = group, y = value) 

waterfall(df)