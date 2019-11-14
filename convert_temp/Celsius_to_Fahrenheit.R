This function converts temperatures in celsius to fahrenheit.
Although, I would mainly use temperatures in celsius 
in my data analysis, I have had instances where the 
hydrolab (what I am using to collect abiotic data in the field) 
accidently gets set to fahrenheit instead of celsius. 
I then have had to convert those values from fahrenheit to celsius 
for data consistency, so a function like this could come in handy going forward. 


install.packages("tidyverse")
library(tidyverse)
library(dplyr)


project_data <- read_csv("/cloud/project/convert_temp/CopyR_project_3_data.csv")

View(project_data)


no_na <- project_data %>% 
  drop_na(Temp)

c_to_f <- function(temp) {
  f <- ((temp*9/5) + 32)
  return(f)}

c_to_f(no_na$Temp)