#### Preamble ####
# Purpose: Tests...
# Author: Kenneth Chan
# Date: 18 April 2023
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####

#### Read data ####
player_data <- read_parquet("data/analysis_data/player_data.parquet")

#### Test data ####
# 11518(earnings of #500) <= earnings <= 288224(earnings of #1)
max(player_data$earnings) <= 288224
min(player_data$earnings) >= 11518

# 0.36 <= rating <= 1.29
max(player_data$rating) <= 1.29
min(player_data$rating) >= 0.36

# 112 <= edpi <= 1208
max(player_data$edpi) <= 1208
min(player_data$edpi) >= 112


