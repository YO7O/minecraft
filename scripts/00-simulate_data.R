#### Preamble ####
# Purpose: Simulate the settings of players and their earnings
# Author: Kenneth Chan
# Date: 26 March 2023
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(randomNames)

#### Simulate data ####
set.seed(124)

#### Simulate data ####
simulated_player_data <- 
  tibble(
    player = randomNames(1000, which.names="first"),
    edpi = rnorm(n = 1000, mean = 300, sd = 100),
    earnings = rnorm(n = 1000, mean = 20000, sd = 5000),
    rating = rnorm(n = 1000, mean = 1, sd = 0.2)
  )



