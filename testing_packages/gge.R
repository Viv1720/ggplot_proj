library(agridat)
data(yan.winterwheat)
dat1 <- yan.winterwheat

library(gge)

m1 <- gge(dat1, yield~gen*env, scale=FALSE)

biplot(m1, main="yan.winterwheat - GGE biplot",
       flip=c(1,0), origin=0, hull=TRUE)

m2 <- gge(dat1, yield~gen*env, scale=TRUE)
biplot(m2, main="yan.winterwheat - GGE biplot",
       flip=c(1,1), origin=0)
