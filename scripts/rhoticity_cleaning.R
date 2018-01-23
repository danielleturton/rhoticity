## LOAD PACKAGES ####
library(dplyr)


## PRELIMINARY ANALYSIS  ####
# ON FAVE DATA ONLY  BEFORE SORTING OUT PROPER WORKFLOW

#load in data from FAVE
data_fave = read.delim("/Users/danielle/Dropbox/projects/Blackburn/rhoticity/r-script/FAVE-extract-r/favers.txt")

# extra data
vowel_list = c("AA", "AE", "AH", "AO", "AW", "AY",  "EH", "EY", "IH", "IY",  "OW",  "UH", "ER", "UH", "UW")
cons_list = c("B", "CH", "D", "DH", "F", "G", "HH", "JH", "K", "L", "M", "N", "NG", "P", "R", "S",   "SH", "T", "TH", "V", "W", "Y", "Z", "ZH")

data_fave_clean = data_fave %>%
  filter(vowel=="R" | vowel=="ER") %>%
  select(-c(26, 28:31, 34:35, 40:42)) %>% 
  rename("start" = "beg", "Word" = "word", "speaker" = "name") %>%
  mutate(fol_seg =  substring(fol_seg, 1, 2),
          F3F2 = F3 - F2, context = recode(context, "coextensive" = "final")) %>%
  mutate(context_life = ifelse(context == "final" & fol_seg %in% vowel_list, "prevoc", 
                             (ifelse(context == "final" & fol_seg %in% cons_list, "precons", 
                                     as.character(context)))))
