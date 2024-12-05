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

#this looks a lot better imo
for(i in unique(surveys$taxa)){
  print(i)
  mytaxon <- surveys %>% filter(taxa == i)
  
  myspecies <- unique(mytaxon$species)
  maxlength <- max(nchar(myspecies))
  
  print(mytaxon %>% filter(nchar(species) == maxlength) %>% select(species) %>% unique())
}



#2
mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mycols <- mloa %>% select(windDir, windSpeed_m_s)

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
#could have just done
mloaF <- mloaF %>% mutate(temp_F_towertop = C_to_F(mloa$temp_C_towertop),
                temp_F_10m = C_to_F(mloa$temp_C_10m),
                temp_F_2m = C_to_F(mloa$temp_C_2m))


for(i in c(mloa$temp_C_10m, mloa$temp_C_2m, mloa$temp_C_towertop)){
  mutate(temp_F_ = C_to_F(i))
}

head(mloa_test)

summary(mloa$baro_hPa)
unique(mloa$baro_hPa)


#challenge
#use lapply to make a new column with Genus and Species as 1 string

surveys %>% mutate(genusspecies = lapply(
  1:nrow(surveys), function(i){
    paste0(surveys$genus[i], " ", surveys$species[i])
  }
))

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

