#### Preamble ####
# Purpose: Downloads and saves the data from 
# Author: Kenneth Chan
# Date: 18 April 2023
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(xml2)
library(rvest)
library(httr)
library(arrow)

#### Download data ####

## Player earniings ##
raw_data <-
  read_html(
    "https://liquipedia.net/valorant/Portal:Statistics/Player_earnings"
  )

earnings_raw_data <-
  raw_data |>
  html_element(".wikitable") |>
  html_table()

## Player settings ##
raw_data <-
  read_html(
    "https://prosettings.net/lists/valorant/"
  )

settings_raw_data <-
  raw_data |>
  html_element(".pro-table") |>
  html_table()

## Player statistics ##
raw_data <-
  read_html(
    "https://www.vlr.gg/stats/?event_group_id=all&event_id=all&region=all&country=all&min_rounds=200&min_rating=1550&agent=all&map_id=all&timespan=all"
  )

stats_raw_data <-
  raw_data |>
  html_element(".wf-table") |>
  html_table()

#### Save data ####
write_parquet(earnings_raw_data, "data/raw_data/earnings.parquet") 
write_parquet(settings_raw_data, "data/raw_data/settings.parquet") 
write_parquet(stats_raw_data, "data/raw_data/stats.parquet") 

         
