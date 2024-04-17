#### Preamble ####
# Purpose: Models... 
# Author: Kenneth Chan
# Date: 26 March 2023
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# Any other information needed?

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Read data ####
player_data <- read_parquet("data/analysis_data/player_data.parquet")


