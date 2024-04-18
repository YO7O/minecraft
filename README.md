# Valorant

## Abstract
This paper aims to analyze the correlation between mouse sensitivity and performance in Valorant. It is one of the common beliefs in Valorant, and many players try to improve at the game with this belief in mind. However, there is no evidence on correlation between sensitivity and performance is found in this paper.

## Overview

This is the repo of the paper "Effects on mouse sensitivity to the performance in Valorant", and the paper can be reproduced by running all the scripts in `scripts` then `paper/paper.qd`

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from https://prosettings.net/lists/valorant/.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

The scripts is written with the help of chatGPT and the entire chat history is available in inputs/llms/usage.txt.
