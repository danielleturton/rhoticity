## LOAD PACKAGES ####
library(dplyr)



## PRELIMINARY ANALYSIS  ####
# ON FAVE DATA ONLY  BEFORE SORTING OUT PROPER WORKFLOW

#load in data from FAVE
data_fave = read.delim("/Users/danielle/Dropbox/projects/Blackburn/rhoticity/r-script/FAVE-extract-r/favers.txt")

data_fave_clean = data_fave %>%
  filter(vowel=="R" | vowel=="ER") %>%
  select(-c(26, 28:31, 34:42)) %>% 
  rename("start" = "beg", "Word" = "word")
