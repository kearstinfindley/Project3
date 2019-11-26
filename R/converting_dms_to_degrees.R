#' Convert degree minute second coordinate values to decimal degree values. 
#'
#' Convert degree minute second coordinate values to decimal degree values.
#' 
#' @param project_data_coord A dataframe containing the columns Latitude and Longitude that have
#' coordinates in the degree minute second format to be converted to the decimal degree format.
#' @return splt A new column with the converted decimal degree coordinate values.
#' @export final_latitude and final_longitude


 
   final_laitude <- function(project_data_coord){
      splt <- project_data_coord %>%
      separate(Latitude, into = c("0", "D", "M", "S")) %>%
      unite(col = "FinalDMS", D, M, S, sep = ",") %>%
      drop_na() %>%
      mutate(deg = dms2deg(FinalDMS, sep=","))
      return(splt)}
   

 
   
   finalLong <- function(project_data_coord){
     splt <- project_data_coord %>%
       separate(Longitude, into = c("0", "D", "M", "S"), convert = TRUE) %>%       
       drop_na() %>% 
       mutate(deg_minute = M / 60 ) %>% 
       mutate(deg_second = S/ 3600) %>% 
       mutate(finalDMS = D + deg_minute + deg_second)
     return(splt)}

 
   