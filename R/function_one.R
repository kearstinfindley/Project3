library(dplyr)
library(leaflet)

thesis_data <- read_csv("/cloud/project/data_output/projects/project_three/R_project_3_data.csv") 

levs <- factor(thesis_data$Genus)
factpal <- colorFactor(topo.colors(5), levs)

thesis_data %>% 
  group_by(Genus) %>% 
  leaflet() %>% 
  addProviderTiles(providers$Stamen.Toner) %>% 
  addCircleMarkers(~decimalLongitude, ~decimalLatitude, color = ~factpal(Genus), stroke = FALSE, fillOpacity = 0.5)