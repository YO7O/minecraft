#### Preamble ####
# Purpose: Models... 
# Author: Kenneth Chan
# Date: 18 April 2023
# Contact: chif.chan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(arrow)
library(knitr)
library(kableExtra)
library(modelsummary)
library(broom)

#### Read data ####
player_data <- read_parquet(here::here("data/analysis_data/player_data.parquet"))

#### Data summary ####
summary_stats <- function(data) {
  # Calculate mean and standard deviation for each column
  means <- colMeans(data, na.rm = TRUE)
  sds <- apply(data, 2, sd, na.rm = TRUE)
  medians <- apply(data, 2, median, na.rm = TRUE)
  q25s <- sapply(data, quantile, 0.25)
  q75s <- sapply(data, quantile, 0.75)
  maxes <- apply(data, 2, max, na.rm = TRUE)
  mins <- apply(data, 2, min, na.rm = TRUE)
  
  # Create a dataframe to store results
  summary_df <- data.frame(
    mean = means,
    sd = sds,
    median = medians,
    q25 = q25s,
    q75 = q75s,
    max = maxes,
    min = mins
  )
  
  return(summary_df)
}

player_summary <- summary_stats(player_data |> select(-player)) 

player_summary |>
  kable(booktables = TRUE,
        digits = 4)

#### EDPI density ####
player_data |> 
  ggplot(aes(x = edpi)) +
  geom_density(fill = "skyblue", color = "darkblue", alpha = 0.5) +
  labs(x = "Effective DPI", y = "Density") +
  theme_minimal()

#### Rating density ####
player_data |> 
  ggplot(aes(x = rating)) +
  geom_density(fill = "skyblue", color = "darkblue", alpha = 0.5) +
  labs(x = "Rating", y = "Density") +
  theme_minimal()

#### Rating plot & model ####
rating_base_plot <- 
  player_data |>
  ggplot(aes(x = edpi, y = rating)) +
  geom_point(alpha = 0.5) +
  labs(
    x = "Effective DPI",
    y = "Rating"
  ) +
  theme_classic()

rating_base_plot +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "black",
    linetype = "dashed",
    formula = "y ~ x"
  )

rating_model <-
  lm(
    rating ~ edpi,
    data = player_data
  )

modelsummary(rating_model, stars = TRUE, estimate = "estimate")

#### Earnings plot & model ####
earnings_base_plot <- 
  player_data |>
  ggplot(aes(x = edpi, y = earnings)) +
  geom_point(alpha = 0.5) +
  labs(
    x = "Effective DPI",
    y = "Earnings (USD)"
  ) +
  theme_classic()

earnings_base_plot +
  geom_smooth(
    method = "lm",
    se = TRUE,
    color = "black",
    linetype = "dashed",
    formula = "y ~ x"
  )

earnings_model <-
  lm(
    earnings ~ edpi,
    data = player_data
  )

broom::tidy(earnings_model) |>
  kable(booktables = TRUE)

modelsummary(earnings_model, stars = TRUE, estimate = "estimate")

#### Clean up all object ####
rm(list = ls())