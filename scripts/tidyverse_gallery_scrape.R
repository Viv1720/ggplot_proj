library(tidyverse)
library(rvest) #html webscraping
library(packageRank) #to retrieve CRAN download counts

df <- read_html("raw_data/exts.ggplot2.tidyverse.org.html")

package_names <- df |>
  html_elements("div.card-content") |> 
  html_elements("span.card-title") |> 
  html_text()

target_date <- Sys.Date()-2

get_total_downloads <- function(pkg) {
  
  #to = 2025 pulls entire download history
  cd <- tryCatch(
    cranDownloads(packages = pkg, to = 2025),
    
    #if the package is not found in cran return NA
    error = function(e) NA
  )
  
  #retrieving the 'cumulative' value of a particular date gets total download count up      to that date
  count <- ifelse(length(cd) == 1, NA, cd$cranlogs.data$cumulative [ 
    cd$cranlogs.data$date == target_date
  ])
  
  data.frame(package = pkg, downloads = count)
}

gallery_packages <- map_dfr(package_names, get_total_downloads)

github_stars <- df |> 
  html_elements("span.github-btn") |>
  html_elements("a.gh-count") |> 
  html_text() |> as.numeric()

gallery_packages$stars = github_stars

gallery_packages$gallery = TRUE

timestamp <- paste("# Gallery data generated on:", Sys.time())

data_lines <- format_csv(gallery_packages)

# Combine and write
write_lines(c(timestamp, data_lines), "generated_data/gallery_packages.csv")
