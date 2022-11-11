# MODULE 08 R Script ============================
# RESTRUCTURE from long to wide =================
library(dplyr)
library(readr)

# READ IN LONG Dataset =========================
long1 <- read_csv("long1.csv")
long1

# USE TIDYR TO PIVOT_WIDER =====================
library(tidyr)
long1_to_wide <- long1 %>%
  tidyr::pivot_wider(id_cols = id,
                     names_from = time,
                     values_from = c(bmi, satis))
long1_to_wide

# READ IN WIDE DATASET ==========================
wide1 <- read_csv("wide1.csv")
wide1

# USE TIDYR PIVOT_LONGER =======================
wide1_to_long1 <- wide1 %>%
  tidyr::pivot_longer(cols = bmi1:satis3)
wide1_to_long1 

# PUT BMI and SATIS in DIFFERENT COLUMNS ========
# slightly "less tidy"
# see https://www.r-bloggers.com/2019/10/data-pivoting-with-tidyr/
# also see https://dcl-wrangle.stanford.edu/

wide1_to_long2 <- wide1 %>%
  tidyr::pivot_longer(cols = bmi1:satis3,
                      names_to = c(".value", "time"),
                      names_pattern = "(.+)(.+)")
wide1_to_long2

