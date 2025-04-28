# good packages to install for this to work smoothly:

install.packages(c("Rcpp","ggplot2","munsell","htmltools","DBI","assertthat",
                   "gridExtra","digest","fpc","TSP","registry","gclus","gplots","RColorBrewer",
                   "stringr","labeling","yaml"))

# You'll need devtools
install.packages.2 <- function (pkg) if (!require(pkg)) install.packages(pkg);
install.packages.2('devtools')
# make sure you have Rtools installed first! if not, then run:
#install.packages('installr'); install.Rtools()

devtools::install_github("ropensci/plotly") # you will probably benefit from the latest version of plotly
devtools::install_github('talgalili/heatmaply')

library("heatmaply")

heatmaply(mtcars, k_row = 3, k_col = 2)
