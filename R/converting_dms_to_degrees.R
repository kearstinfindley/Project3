These functions convert latitude and longitude coordinates in degree minute seconds format to decimal degrees format.
This is super helpful because the gps I use in the field gives you coordinates in dms, and then I convert
to decimal degrees by hand later. 

Instructions for Latitude conversion: 
   1) install packages below (tidyverse) and load the librarys below (tidyverse, tidyr, dplyr)
   2) upload your dataframe in a csv format
   3) set your dataframe to a variable (project_data_coord)
   4) create the function referencing your dataframe: 
      5) separate your values in the latitude column by (degree minute seconds)
      6) combine the d,m,s in a new column
      7) get rid of any NA values
      8) convert from degree minute seconds to decimal degrees
      9) return the function
   10) apply the function to your data to view the converted values

Instructions for longitude conversion function:
   1) follow steps 1-4 above for setting up your function then:
      2) separate degree minute seconds in your longitude column and convert the values to numeric values
      3) drop NA values
      4) divide the minutes values by 60
      5) divide the seconds value by 3600
      6) add the deg minute seconds values in a new column to convert from dms to dd
      9) return the function
   10) apply the function to your data to view the converted values


install.packages("tidyverse")
library(tidyverse)
library(dplyr)
library(tidyr)


project_data_coord <- read.csv("/cloud/project/data/R_project_3_data_coord.csv", stringsAsFactors = FALSE)


 
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
   