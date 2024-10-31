library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")
surveys_meanhindfootlength <- surveys %>% filter(!is.na(hindfoot_length)) %>% group_by(genus, plot_type) %>% summarize(mean_hindfoot_length = mean(hindfoot_length))

unique(surveys$plot_type)
n_distinct(surveys$plot_type)

unique(is.na(surveys_meanhindfootlength$mean_hindfoot_length))
n_distinct(surveys_meanhindfootlength$plot_type)

surveys_wide <- surveys_meanhindfootlength %>%  pivot_wider(names_from = "plot_type", values_from = "mean_hindfoot_length") %>% arrange(Control)

surveys_wide

#2
summary(surveys)

surveys_ifcat <- surveys


#surveys_ifcat <- surveys %>% filter(!is.na(weight)) %>%  mutate(weight_cat = "Large" | ifelse(weight < 48 & weight >= 20, yes = "medium", no = "small"))

surveys_ifcat$weight_cat <- "Large"

surveys_ifcat$weight_cat <- ifelse(surveys_ifcat$weight >=20, yes = "medium", no = "small")

surveys_ifcat$weight_cat %>%  ifelse(surveys)

#surveys_ifcat$weight_cat <- filter(surveys_ifcat$weight != "Large") %>%  ifelse(surveys_ifcat$weight < 48 & surveys_ifcat$weight >=20, yes = "medium", no = "small")

unique(surveys_ifcat$weight_cat)

surveys_cat <- surveys %>% filter(!is.na(weight)) %>%  mutate(weight_cat = case_when(weight >= 48 ~ "Large", weight > 20 ~ "Medium", TRUE ~ "Small"))

unique(surveys_cat$weight_cat)