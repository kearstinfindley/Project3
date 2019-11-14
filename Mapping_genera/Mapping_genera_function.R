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


install.packages("tidyverse")
library(tidyverse)
library(dplyr)
install.packages("leaflet")
library(leaflet)

project_data <- read_csv("/cloud/project/Mapping_genera/Copy_2_R_project_3_data.csv")

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


