library(tidyverse)

data <- "https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv"

sports <- read_csv(data)
sports_run <- sports %>% filter(sport == 'running', minutes_per_mile <= 10, minutes_per_mile >= 5, total_elapsed_time_s >= 60)

sports_run <- sports_run %>% mutate(pace = case_when(minutes_per_mile < 6 ~ "fast",
                                       minutes_per_mile >= 6 &
                                     minutes_per_mile <= 8 ~ "medium",
                                     minutes_per_mile > 8 ~ "slow"
                                       ))
sports_run <- sports_run %>% mutate(form = ifelse(year == 2024, "new", "old"))

sports_run_avg <- sports_run %>% group_by(pace, form) %>%  summarize(avg_steps_per_minute = mean(steps_per_minute))

sports_run_avg_wide <- sports_run_avg %>% pivot_wider(id_cols = 'form', names_from = 'pace', values_from = avg_steps_per_minute) %>% select('form', 'slow', 'medium', 'fast')

#Couldn't get the last one in time!
#last <- sports_run %>% filter(month %in% 1:6, year == 2024) %>% group_by(sport) %>% summarize(sports_run, minimum = min(steps_per_minute))

unique(is.na(sports_run$steps_per_minute))

table(sports_run_avg)

unique(sports_run$form)


summary(sports_run$minutes_per_mile)



unique(sports$sport)

sports