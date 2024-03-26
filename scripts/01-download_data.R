#### Preamble ####
# Purpose: Downloads and saves the data from 
# Author: Kenneth Chan
# Date: 26 March 2023
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# Any other information needed?


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]



#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
