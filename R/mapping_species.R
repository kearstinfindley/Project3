#' Map locality data by the Genus column in a dataframe. 
#'
#' Map latitude and longitude of different genera using 
#' different colors to represent each genera.
#' 
#' @param map A dataframe containing a column titled Genus that you would like to map by the associated coordinates.
#' @return genera A map that plots different genera utilizing different colors for each genera.
#' @export map_genera


This function maps the localites I have sampled thus far for each one of my
species. The localities are colored by genera, and the genera included only have 
one representative species. 


Instructions to map genera:
1) install needed packages below (tidyverse and leaflet)
2) load needed librarys below (tidyverse, dplyr, and leaflet)
3) upload your data frame in a csv format
4) set your data frame to a variable (project_data or map)
5) create a color palate using levs and factpal to color by genera
6) set up function to map by genera referencing your dataframe:
        7) group by your desired column (Genus)
        8) set up a leaflet map
        9) add your background map (addProviderTiles)
        10) add your makers by plotting your coordinate columns (decimalLatiude/decimalLongitude) and coloring them by the Genus column
        11) return the map
12) plot the map with your data

install.packages("tidyverse")
library(tidyverse)
library(dplyr)
install.packages("leaflet")
library(leaflet)

project_data <- read_csv("/cloud/project/data/R_project_3_data.csv")

map <- project_data

levs <- factor(project_data$Genus)
factpal <- colorFactor(topo.colors(5), levs)

map_genera <- function(map) {
       genera <- map %>% 
       group_by(Genus) %>% 
       leaflet() %>% 
       addProviderTiles(providers$Stamen.Toner) %>% 
       addCircleMarkers(~decimalLongitude, ~decimalLatitude, color = ~factpal(Genus), stroke = FALSE, fillOpacity = 0.5) 
       return(genera)}

map_genera(project_data)


