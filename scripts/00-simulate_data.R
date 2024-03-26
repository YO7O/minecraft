#### Preamble ####
# Purpose: Simulate the settings of players and their earnings
# Author: Kenneth Chan
# Date: 26 March 2023
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# Any other information needed?


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
data <- 
  tibble(
    edpi = rnorm(n = 1000, mean = 100, sd = 10),
    earnings = rnorm(n = 1000, mean = 20000, sd = 5000)
  )



