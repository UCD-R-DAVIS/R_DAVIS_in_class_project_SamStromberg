library(tidyverse)

mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv", col_types = "")

unique(mloa$hour24)
unique(mloa$min)
unique(mloa$month)

mloa %>% count(rel_humid == -99 & temp_C_2m == -999.9)
mloa %>% count(windSpeed_m_s == -999.9)

mloa <- mloa %>% mutate(day = as.character(day), month = as.character(month), hour24 = as.character(hour24), min = as.character(min), year = as.character(year)) # preparing for lubridate


mloa <- mloa %>% filter(rel_humid != -99, temp_C_2m != -999.9, windSpeed_m_s != -999.9) #removing NAs

mloa$datetime <- paste(mloa$year, "-", mloa$month,
                                "-", mloa$day, ", ", mloa$hour24, ":",
                                mloa$min, sep = "")

mloa$datetime <- ymd_hm(as.character(mloa$datetime)) #to lubridate

mloa$datetimeLocal <- with_tz(mloa$datetime, tzone = "Pacific/Honolulu")

tz(mloa$datetimeLocal)

mloa1 <- mloa %>% mutate(HImonth = month(datetimeLocal), HIhour = hour(datetimeLocal))


mloahrtemp <- mloa1 %>% group_by(HImonth, HIhour) %>% summarize(meantemp = mean(temp_C_2m))

mloahrtemp %>% count(HImonth)

ggplot(mloahrtemp, aes(x = HImonth, y = meantemp, color = HIhour)) + geom_point() + scale_color_viridis_c() + theme_light() + xlab("Month") + ylab("Avg Temp in C") + scale_x_continuous(breaks = 1:12)
