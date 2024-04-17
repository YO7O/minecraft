#### Preamble ####
# Purpose: Clean and select data needed from raw data
# Author: Kenneth Chan
# Date: 18 April 2023
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(arrow)
library(readr)

#### Import raw data ####
earnings_raw_data <- read_parquet("data/raw_data/earnings.parquet")
settings_raw_data <- read_parquet("data/raw_data/settings.parquet")
stats_raw_data <- read_parquet("data/raw_data/stats.parquet")

#### Clean data ####
## Player earnings ##
player_earnings <-
  earnings_raw_data |>
  clean_names() |>
  select(player, earnings) |>
  drop_na() |>
  mutate(earnings = parse_number(earnings))

## Player settings ##
player_settings <-
  settings_raw_data |>
  clean_names() |>
  select(player, e_dpi) |>
  drop_na() |>
  rename(edpi = e_dpi)

## Player statistics ##
player_stats <-
  stats_raw_data |>
  clean_names() |>
  select(player, r) |>
  drop_na() |>
  rename(rating = r) |>
  mutate(player = str_extract(player, "[A-Za-z0-9]+"))

player_data <-
  merge(player_settings, player_earnings) |>
  merge(player_stats)
  

#### Save data ####
write_parquet(player_data, "data/analysis_data/player_data.parquet")
