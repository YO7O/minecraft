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

#### Read data ####
player_data <- read_parquet("data/analysis_data/player_data.parquet")

#### Data summary ####
summary_stats <- function(data) {
  # Calculate mean and standard deviation for each column
  means <- colMeans(data, na.rm = TRUE)
  sds <- apply(data, 2, sd, na.rm = TRUE)
  maxes <- apply(data, 2, max, na.rm = TRUE)
  mins <- apply(data, 2, min, na.rm = TRUE)
  
  # Create a dataframe to store results
  summary_df <- data.frame(
    mean = means,
    sd = sds,
    max = maxes,
    min = mins
  )
  
  return(summary_df)
}

summary_stats(player_data |> select(-player)) |>
  kable(booktables = TRUE)

#### EDPI density ####
player_data |> 
  ggplot(aes(x = edpi)) +
  geom_density(fill = "skyblue", color = "darkblue", alpha = 0.5) +
  labs(x = "Effective DPI", y = "Density") +
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

summary(rating_model)

#### Earnings plot & model ####
earnings_base_plot <- 
  player_data |>
  ggplot(aes(x = e_dpi, y = earnings)) +
  geom_point(alpha = 0.5) +
  labs(
    x = "Effective DPI",
    y = "Earnings (USD)"
  ) +
  theme_classic()

earnings_base_plot +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "black",
    linetype = "dashed",
    formula = "y ~ x"
  )

earnings_model <-
  lm(
    earnings ~ e_dpi,
    data = player_data
  )

summary(earnings_model)
