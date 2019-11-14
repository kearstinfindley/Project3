These functions convert latitude and longitude coordinates in degree minute seconds format to decimal degrees format.
This is super helpful because the gps I use in the field gives you coordinates in dms, and then I convert
to decimal degrees by hand later. 

install.packages("tidyverse")
library(tidyverse)
library(dplyr)
library(tidyr)


project_data_coord <- read.csv("/cloud/project/Project_3_convert_coordinates/CopyR_project_3_data_coord.csv", stringsAsFactors = FALSE)



final_laitude <- function(project_data_coord){
  splt <- project_data_coord %>%
    separate(Latitude, into = c("0", "D", "M", "S")) %>%
    unite(col = "FinalDMS", D, M, S, sep = ",") %>%
    drop_na() %>%
    mutate(deg = dms2deg(FinalDMS, sep=","))
  return(splt)}

lat$deg



finalLong <- function(project_data_coord){
  splt <- project_data_coord %>%
    separate(Longitude, into = c("0", "D", "M", "S"), convert = TRUE) %>%       
    drop_na() %>% 
    mutate(deg_minute = M / 60 ) %>% 
    mutate(deg_second = S/ 3600) %>% 
    mutate(finalDMS = D + deg_minute + deg_second)
  return(splt)}

dat$finalDMS 