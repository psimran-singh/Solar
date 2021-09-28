setwd("~/Rutgers Fall 2021/Theory and Practice of Public Informatics/")

library(dplyr)
library(tidyverse)
library(readr)

###IMPORT DATA FILES###
project_sunroof_county <- read.csv("Solar Data Files/project-sunroof-county.csv")
pop_by_race <- read.csv("Solar Data Files/StatsAmerica Datasets/Population-by-Race/Population by Race - US, States, Counties.csv")
pop_by_age_sex <- read.csv("Solar Data Files/StatsAmerica Datasets/Population-by-Age-and-Sex/Population by Age and Sex - US, States, Counties.csv")
metrics_dev1 <- read.csv("Solar Data Files/StatsAmerica Datasets/Metrics-For-Development/Metrics For Development.csv")

###LIMIT ALL DATASETS TO SELECT STATES AND YEARS###
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

metrics_dev2 <- subset(metrics_dev1,
                 metrics_dev1$Year=="2019",
                 select=c(1:8))

metrics_dev3 <- data.frame()
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', NY',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', NJ',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', PA',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', CT',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', RI',metrics_dev2$Description)))

metrics_dev4 <- metrics_dev3[c(3:8)]

#pick out select variables
metrics_dev5 <- data.frame()
#snap benefits per capita
metrics_dev5 <- rbind(metrics_dev5, dplyr::filter(metrics_dev4,M4D_Code==10200)
#

###REFORMAT COUNTY AND STATE VARIABLES TO MERGE ALL DATASETS###
apred3$County.Name <- str_c(apred3$Description, " County")
apred3 <- apred3[c(-3)]
apred3$Description <- str_c(apred3$County.Name,", ",apred3$State.Abbreviation)
apred3 <- apred3[c(12,11,3,4:10)]

northeast_sunroof$State.Abbreviation <- state.abb[match(northeast_sunroof$state_name,state.name)]
northeast_sunroof$Description <- str_c(northeast_sunroof$region_name,", ",northeast_sunroof$State.Abbreviation)
northeast_sunroof <- northeast_sunroof[c(-2)]
northeast_sunroof <- rename(northeast_sunroof, "County.Name"="region_name")
northeast_sunroof <- northeast_sunroof[c(26,1,25,2:24)]

pop_demographics <- pop_demographics[c(4:25)]


###ADDITIONAL TRANSFORMATIONS###
#Create percentages for demographic data
pop_dem_pct <- pop_demographics
pop_dem_pct[, -(1:3)] <- sweep(pop_dem_pct[, -(1:3)], 1, pop_dem_pct[, 3], "/")

namelist <- unique(metrics_dev4$M4D_Code)
t_metrics_dev0 <- t(metrics_dev4[1:228,6])
colnames(t_metrics_dev0) <- namelist
t_metrics_dev <- cbind(metrics_dev4[1,2:3],t_metrics_dev0)
names(t_metrics_dev) <- namelist

aaa=t(apred4[1:21,6])  ### so this code extract the values from 1-21 rows and 6th column and tranpose it to 1 row 21 columns
aaa=rbind(aaa,t(apred4[22:42,6]))  ### you can write a loop to replace the 22:42 here, so that R can automatically extract every 21 rows
aaa  ### I just wanted to show you an example of how the output looks like

  
rm(pop_by_age_sex,pop_by_age_sex2,pop_by_age_sex3)
rm(pop_by_race,pop_by_race2,pop_by_race3)
rm(project_sunroof_county)
rm(apred1,apred2)
rm(metrics_dev0,metrics_dev1,metrics_dev2,metrics_dev3,metrics_dev5)
