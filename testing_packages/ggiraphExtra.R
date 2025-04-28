require(ggplot2)
require(ggiraph)
require(ggiraphExtra)

ggPoints(aes(x=wt,y=mpg,color=am),data=mtcars,method="lm",interactive=TRUE)

require(TH.data)
data(GBSG2)
ggPoints(aes(x=pnodes,y=cens),data=GBSG2,method="glm",interactive=TRUE)

ggRadar(data=iris,aes(color=Species),interactive=TRUE)

ggBoxplot(iris,aes(color=Species),interactive=TRUE)
