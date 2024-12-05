library(tidyverse)
library(dplyr)
surveys <- read.csv("data/portal_data_joined.csv")

#1

##TRICKY i got got
  for(i in unique(surveys$taxa)){
    print(i)
    mytaxon <- surveys[surveys$taxa == i,]  # why surveys[surveys$taxa]...
    longestnames <- mytaxon[nchar(mytaxon$species) == max(nchar(mytaxon$species)),] %>% select(species)
    print(paste0("The longest species name(s) among ", i, "s is/are: "))
    print(unique(longestnames$species))
  }



#2
mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")


map(mloa, max)


mloa %>% mutate(temp_F_towertop = (temp_C_towertop*1.8 + 32))

mloa$temp_C_towertop*1.8 + 32

C_to_F <- function(x){
  x*1.8 + 32 
}

mloaF <- mloa
mloaF <- mloaF %>% mutate(temp_F_towertop = C_to_F(mloa$temp_C_towertop))
mloaF <- mloaF %>% mutate(temp_F_10m = C_to_F(mloa$temp_C_10m))
mloaF <- mloaF %>% mutate(temp_F_2m = C_to_F(mloa$temp_C_2m))





head(mloa_test)

summary(mloa$baro_hPa)
unique(mloa$baro_hPa)

#Messing around
for(i in unique(surveys$taxa)){
  print(i)
  #mytaxon <- surveys$taxa == i  # why surveys[surveys$taxa]...
  #longestnames <- mytaxon[nchar(mytaxon$species) == max(nchar(mytaxon$species)),] %>% select(species)
  #print(paste0("The longest species name(s) among ", i, "s is/are: "))
  #print(unique(longestnames$species))
}



#Aborted Attempts/Testing

for(i in unique(surveys$taxa{
  taxa <- nchar(unique(i))
  print(i)
}


nchar(unique(surveys$species))

unique(surveys$taxa)

surveys %>% group_by(taxa) %>% nchar(unique(surveys$species)) 


surveys[surveys$taxa == "Rodent",]

surveys %>% group_by(taxa) %>% filter(taxa == "Reptile") %>% count()

surveys$taxa == 1

