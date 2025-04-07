library(tidyverse)
library(packageRank)

sorted_packages <- read_csv("generated_data/all_packages.csv", skip = 2)

#top 30 packages by download count, excludes ggplot2
top_packages <- c(sorted_packages$package[2:31])

#all packages that can be found on CRAN (cran download count is not null)
packages_in_cran <- c(sorted_packages$package[!is.na(sorted_packages$downloads)])

get_cd_data <- function(pkg) {
  cranDownloads(packages = pkg, to = 2025)$cranlogs.data
}

dc_top_packages <- map_dfr(top_packages, get_cd_data)
dc_cran_packages <- map_dfr(packages_in_cran, get_cd_data)

write_csv(dc_top_packages, "generated_data/dc_top_packages.csv")
write_csv(dc_cran_packages, "generated_data/dc_cran_packages.csv")