## LOAD PACKAGES ####
library(ggplot2)
library(dplyr)

## READ IN DATA ####
source("scripts/rhoticity_cleaning.R")  

data_fave_figures = data_fave_clean %>%  
  mutate(sex = recode(sex,  "m" = "male",  "f" = "female"))

## AESTHETICS ###
theme_set(theme_bw())


## PLOTS ####
#Sex
data_fave_figs_sex = data_fave_figures %>%
  group_by(sex, speaker, Word)%>%
  #summarise(F1 = mean(F1))%>%
  summarise(F3F2 = mean(F3F2, na.rm=TRUE))%>%
  #mutate(morphClass = reorder(morphClass, -td, mean))%>%
  ungroup()

sex.plot = ggplot(data_fave_figs_sex, aes(x = sex, y = F3F2, fill = sex)) +
  geom_boxplot() +
  ylab("F3-F2") +
  theme(legend.position="none") +
  scale_fill_brewer(palette="Pastel1") 

pdf("figures/rhoticity_sex.pdf", width=6, height=4)
sex.plot
dev.off()


