library(tidyverse)
library(rvest) #html webscraping
library(packageRank) #to retrieve CRAN download counts

df <- read_html("raw_data/CRAN_ Available Packages By Name.html")

names <- df |>
  html_elements("span.CRAN") |> 
  html_text()

gg_start <- which(substr(names, 1, 2) == "gg")[1] 
#end index for 'gg' names
gg_end <- which(substr(names, 1, 2) == "gh")[1] - 1 

gg_package_names <- names[gg_start:gg_end]

remove_packages <- read.csv("raw_data/non_ggplot_packages.csv")[[1]]

ggplot_package_names <- gg_package_names[!gg_package_names %in% remove_packages]

#returns a vector that alternates between package names and their descriptions
desc <- df |>
  html_elements("div.container") |> 
  html_elements("table") |> 
  html_elements("tbody") |> 
  html_elements("tr") |> 
  html_elements("td") |> 
  html_text()

#beginning index for 'gg' names in descriptions
first_gg <- which(substr(desc, 1, 2) == "gg")[1] 

#end index for 'gg' names in descriptions
end_gg <- which(substr(desc, 1, 2) == "gh")[1] - 1 

desc_gg <- desc[first_gg:end_gg]

#Select only descriptions (remove package names) by storing every other element
gg_descriptions <- desc_gg[c(FALSE, TRUE)]

#removes line breaks in descriptions to match csv file formatting
gg_descriptions <- gsub("\n", " ", gg_descriptions)

remove_desc <- read.csv("raw_data/non_ggplot_desc.csv")[[1]]

ggplot_descriptions <- gg_descriptions[!gg_descriptions %in% remove_desc]

#Add the additional ggplot package names and descriptions found and saved down
add_gg_names <- read.csv("raw_data/add_ggplot_names.csv")[[1]]
add_gg_desc <- read.csv("raw_data/add_ggplot_desc.csv")[[1]]

all_ggplot_packages <- c(ggplot_package_names, add_gg_names)
all_ggplot_desc <- c(ggplot_descriptions, add_gg_desc)

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

cran_packages <- map_dfr(all_ggplot_packages, get_total_downloads)

cran_packages$description = all_ggplot_desc
cran_packages$CRAN = TRUE

head(cran_packages)

timestamp <- paste("# CRAN data generated on:", Sys.time())

data_lines <- format_csv(cran_packages)

# Combine and write
write_lines(c(timestamp, data_lines), "generated_data/cran_packages.csv")

