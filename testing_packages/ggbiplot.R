library(ggplot2)
library(ggbiplot)
library(dplyr)
library(corrplot)

# set ggplot2 theme
theme_set(theme_minimal(base_size = 14))

data(crime)
crime |> 
  dplyr::select(where(is.numeric)) |> 
  cor() |> 
  corrplot(method = "ellipse", tl.srt = 0)

crime.pca <- 
  crime |> 
  dplyr::select(where(is.numeric)) |>
  prcomp(scale. = TRUE)

crime.pca

ggbiplot(crime.pca,
         labels = crime$st ,
         circle = TRUE,
         varname.size = 4,
         varname.color = "red") 

crime.pca <- reflect(crime.pca)

ggbiplot(crime.pca,
         groups = crime$region,
         labels = crime$st,
         labels.size = 4,
         var.factor = 1.4,
         ellipse = TRUE, ellipse.level = 0.5, ellipse.alpha = 0.1,
         circle = TRUE,
         varname.size = 4,
         varname.color = "black") +
  labs(fill = "Region", color = "Region") +
  theme(legend.direction = 'horizontal', legend.position = 'top') +
  geom_point()


