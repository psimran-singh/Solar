setwd("~/Rutgers Fall 2021/Theory and Practice of Public Informatics/")

library(dplyr)
library(tidyverse)

###IMPORT DATA FILES###
project_sunroof_county <- read.csv("Solar Data Files/project-sunroof-county.csv")
pop_by_race <- read.csv("Solar Data Files/StatsAmerica Datasets/Population-by-Race/Population by Race - US, States, Counties.csv")
pop_by_age_sex <- read.csv("Solar Data Files/StatsAmerica Datasets/Population-by-Age-and-Sex/Population by Age and Sex - US, States, Counties.csv")
apred <- read.csv("Solar Data Files/StatsAmerica Datasets/APRED/APRED - Disaster Resilience - Counties.csv")

###LIMIT ALL DATASETS TO SELECT STATES###
northeast_sunroof <- subset(project_sunroof_county,
  project_sunroof_county$state_name=="New York" |
  project_sunroof_county$state_name=="Pennsylvania" |
  project_sunroof_county$state_name=="New Jersey" |
  project_sunroof_county$state_name=="Connecticut" |
  project_sunroof_county$state_name=="Rhode Island",
select=c(1:2,9:31))

pop_by_race2 <- subset(pop_by_race,
                pop_by_race$Year=="2019",
                select=c(1:14))

pop_by_race3 <- data.frame()
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', NY',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', NJ',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', PA',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', CT',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', RI',pop_by_race2$Description)))

pop_by_age_sex2 <- subset(pop_by_age_sex,
                   pop_by_age_sex$Year=="2019",
                   select=c(1:17))

pop_by_age_sex3 <- data.frame()
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', NY',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', NJ',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', PA',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', CT',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', RI',pop_by_age_sex2$Description)))

pop_demographics <- merge(pop_by_age_sex3,pop_by_race3)

apred2 <- subset(apred,
                 apred$Year=="2019",
                 select=c(1:11))

apred3 <- subset(apred2, apred2$State.Abbreviation=='NJ' |
                         apred2$State.Abbreviation=='NY' |
                         apred2$State.Abbreviation=='CT' |
                         apred2$State.Abbreviation=='PA' |
                         apred2$State.Abbreviation=='RI',
                 select=c(1:11))


###REFORMAT COUNTY AND STATE VARIABLES TO MERGE ALL DATASETS###
apred3$region_name <- str_c(apred3$Description, " County")
apred3 <- apred3[c(-3)]
rename(apred3, "region_name"="Description")

northeast_sunroof$State.Abbreviation <- state.abb[match(northeast_sunroof$state_name,state.name)]
northeast_sunroof$Description <- str_c(northeast_sunroof$region_name,", ",northeast_sunroof$State.Abbreviation)
northeast_sunroof <- northeast_sunroof[c(-2)]

rm(pop_by_age_sex,pop_by_age_sex2,pop_by_age_sex3)
rm(pop_by_race,pop_by_race2,pop_by_race3)
rm(project_sunroof_county)
