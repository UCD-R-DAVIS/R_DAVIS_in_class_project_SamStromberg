library(tidyverse)
data <- "https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"

data0 <- read_csv(data)

rundata <- data0 %>% filter(sport == "running", minutes_per_mile < 10, minutes_per_mile > 5, total_elapsed_time_s > 60)

rundata <- rundata %>% mutate(time_period = case_when(year < 2024 ~ "Pre-2024",
                                           year = 2024 & month <=6 ~ "1st_half_2024",
                                           year = 2024 & month > 6 ~ "2nd_half_2024"))

summary(is.na(rundata$time_period))

# Make a scatter plot that graphs SPM over speed by lap.

ggplot(data = rundata, aes(x = steps_per_minute, y = minutes_per_mile)) + geom_point(aes(color = time_period), alpha = .6) + theme_gray()

# Add linear (i.e., straight) trendlines to the plot to show the relationship between speed and SPM for each of the three time periods (hint: you might want to check out the options for geom_smooth())

ggplot(data = rundata, aes(x = steps_per_minute, y = minutes_per_mile, color = time_period)) + geom_point(alpha = .6) + geom_smooth(method = "lm", se = FALSE) + scale_y_continuous(limits = c(5, 10)) + theme_gray() 

# Does this relationship maintain or break down as Tyler gets tired? Focus just on post-intervention runs (after July 1, 2024). Make a plot (of your choosing) that shows SPM vs. speed by lap. Use the timestamp indicator to assign lap numbers, assuming that all laps on a given day correspond to the same run (hint: check out the rank() function). Select only laps 1-3 (Tyler never runs more than three miles these days). Make a plot that shows SPM, speed, and lap number (pick a visualization that you think best shows these three variables).

rundata %>% filter(time_period == "2nd_half_2024")

rundata_post <- rundata %>% filter(time_period == "2nd_half_2024")


#post 1hr, but messing around

rundata_post <- rundata_post %>% group_by(day(timestamp)) %>%   mutate(lap_number = rank(timestamp)) #adds a lap number within each run on each day

rundata_post$lap_number <- as.factor(rundata_post$lap_number) #to assign lap number discrete colors

levels(rundata_post$lap_number)


#can't quite figure out a good way to represent this
rundata_post %>% filter(lap_number %in% c(1:3)) %>% ggplot(data = ., aes(x = steps_per_minute, y = minutes_per_mile, color = lap_number)) + geom_point(alpha = .8) + geom_smooth(se = FALSE)

#maybe this way? seems like first lap is a warm up, second lap tends to be higher pace, third lap has a lot of variability

rundata_post %>% filter(lap_number %in% c(1:3)) %>% ggplot(data = ., aes(x = steps_per_minute, y = minutes_per_mile, color = lap_number)) + geom_point(alpha = .8) + geom_smooth(se = FALSE) + facet_wrap(~lap_number)



#bad tests
rundata_post %>% filter(lap_number %in% c(1:3)) %>% ggplot(data = ., aes(x = steps_per_minute, y = minutes_per_mile, color = lap_number)) + geom_point(alpha = .8) + geom_bin2d(bins = 5, alpha = .3)



ggplot(data = rundata %>% filter(time_period == "2nd_half_2024"), aes(x = steps_per_minute, y = minutes_per_mile)) + geom_point()
