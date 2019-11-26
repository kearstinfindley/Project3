#' Map locality data by the Genus column in a dataframe. 
#'
#' Map latitude and longitude of different genera using 
#' different colors to represent each genera.
#' 
#' @param map A dataframe containing a column titled Genus that you would like to map by the associated coordinates.
#' @return genera A map that plots different genera utilizing different colors for each genera.
#' @export map_genera



map_genera <- function(map) {
       genera <- map %>% 
       group_by(Genus) %>% 
       leaflet() %>% 
       addProviderTiles(providers$Stamen.Toner) %>% 
       addCircleMarkers(~decimalLongitude, ~decimalLatitude, color = ~factpal(Genus), stroke = FALSE, fillOpacity = 0.5) 
       return(genera)}




