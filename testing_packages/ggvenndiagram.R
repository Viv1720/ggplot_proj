library(ggVennDiagram)
library(ggplot2)

genes <- paste("gene",1:1000,sep="")
x <- list(A=sample(genes,300),
          B=sample(genes,525),
          C=sample(genes,440),
          D=sample(genes,350))

class(ggVennDiagram(x, set_color = c("blue","red","green","purple")))
