surveys <- read.csv("data/portal_data_joined.csv")
surveys_base <- surveys[1:5000,c('plot_type', 'species_id', 'weight')] 

surveys_base$plot_type <- factor(surveys_base$plot_type)
surveys_base$species_id <- factor(surveys_base$species_id)

# surveys_base <- surveys_base[na.omit(surveys_base$weight),] why does this leave in some na's?
# table(surveys_base$weight)
# summary(surveys_base$weight)
# na.fail(surveys_base)
# na.omit(surveys_base$weight)

surveys_base <- surveys_base[!is.na(surveys_base$weight),]

na.fail(surveys_base)

unique(is.na(surveys_base$weight)) #to check if na's remain in weight

challenge_base <- surveys_base[surveys_base$weight>150,]

summary(challenge_base)

