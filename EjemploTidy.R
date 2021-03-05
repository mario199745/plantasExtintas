library(tidyverse)
data("mtcars")
#Filtro 
 
Mt <- mtcars %>% filter( cyl == 8 )
