library(ggcorrplot)

data(mtcars)
corr <- round(cor(mtcars), 1)
head(corr[, 1:6])

p.mat <- cor_pmat(mtcars)
head(p.mat[, 1:4])

ggcorrplot(corr)
ggcorrplot(corr, method = "circle")
ggcorrplot(corr, hc.order = TRUE, outline.color = "white")
ggcorrplot(corr,
           hc.order = TRUE,
           type = "lower",
           outline.color = "white")
