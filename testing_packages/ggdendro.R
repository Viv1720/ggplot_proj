library(ggplot2)
library(ggdendro)

hc <- hclust(dist(USArrests), "ave")
ggdendrogram(hc, rotate = FALSE, size = 2)

model <- hclust(dist(USArrests), "ave")
dhc <- as.dendrogram(model)

# Rectangular lines
ddata <- dendro_data(dhc, type = "rectangle")
p <- ggplot(segment(ddata)) + 
  geom_segment(aes(x = x, y = y, xend = xend, yend = yend)) + 
  coord_flip() + 
  scale_y_reverse(expand = c(0.2, 0))
p
