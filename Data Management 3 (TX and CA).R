setwd("~/Rutgers Fall 2021/Theory and Practice of Public Informatics/")

library(dplyr)
library(tidyverse)
library(readr)

###IMPORT DATA FILES###
project_sunroof_county <- read.csv("Solar Data Files/project-sunroof-county.csv")
pop_by_race <- read.csv("Solar Data Files/StatsAmerica Datasets/Population-by-Race/Population by Race - US, States, Counties.csv")
pop_by_age_sex <- read.csv("Solar Data Files/StatsAmerica Datasets/Population-by-Age-and-Sex/Population by Age and Sex - US, States, Counties.csv")
metrics_dev1 <- read.csv("Solar Data Files/StatsAmerica Datasets/Metrics-For-Development/Metrics For Development.csv")
social_context0 <- read.csv("Solar Data Files/StatsAmerica Datasets/Social-Context/Social Context.csv")

###LIMIT ALL DATASETS TO SELECT STATES AND YEARS###
northeast_sunroof <- subset(project_sunroof_county,
  project_sunroof_county$state_name=="Texas" |
  project_sunroof_county$state_name=="California",
select=c(1:2,9:31))

pop_by_race2 <- subset(pop_by_race,
                pop_by_race$Year=="2019",
                select=c(1:14))

pop_by_race3 <- data.frame()
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', TX',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', CA',pop_by_race2$Description)))


pop_by_age_sex2 <- subset(pop_by_age_sex,
                   pop_by_age_sex$Year=="2019",
                   select=c(1:17))

pop_by_age_sex3 <- data.frame()
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', TX',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', CA',pop_by_age_sex2$Description)))


pop_demographics <- merge(pop_by_age_sex3,pop_by_race3)
pop_demographics <- pop_demographics[c(4:25)]


metrics_dev2 <- subset(metrics_dev1,
                 metrics_dev1$Year=="2019",
                 select=c(1:8))

metrics_dev3 <- data.frame()
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', TX',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', CA',metrics_dev2$Description)))



social_context1 <- data.frame()
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', TX',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', CA',social_context0$Description)))


###SELECT VARIABLES###
metrics_dev4 <- metrics_dev3[c(3:8)]
metrics_dev5 <- data.frame()
#snap benefits per capita
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==10200,])
#percent of population that is insured
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==10700,])
#property crime per 1000 population
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==14100,])
#violent crime per 1000 population
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==14000,])
#net migration rate
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==22100,])
#percent of population with high school diploma
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==21900,])
#percent of population with bachelor's degree
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==22000,])
#poverty rate
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==22200,])
#population density
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==22900,])
#proportion of single parent households
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==13600,])
#suicide rate
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==13700,])
#percent of working population that works full-time (35+ hrs) year round
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==14700,])

metrics_dev5 <- metrics_dev5[order(metrics_dev5$Description),]
rownames(metrics_dev5) <- NULL

social_context2 <- social_context1[c(4,6:8)]
social_context3 <- social_context2
# social_context3 <- data.frame()
# #income per capita
# social_context3 <- rbind(social_context3, social_context2[social_context2$Social_Context_Code==103,])
# #entrepreneurship
# social_context3 <- rbind(social_context3, social_context2[social_context2$Social_Context_Code==101,])
# #belief in science
# social_context3 <- rbind(social_context3, social_context2[social_context2$Social_Context_Code==206,])
# #risk taking
# social_context3 <- rbind(social_context3, social_context2[social_context2$Social_Context_Code==213,])
# #religiosity
# social_context3 <- rbind(social_context3, social_context2[social_context2$Social_Context_Code==212,])

social_context3 <- social_context3[order(social_context3$Description),]
rownames(social_context3) <- NULL

social_context3$Social_Context_Domain_Data <- as.numeric(social_context3$Social_Context_Domain_Data)

#Check which counties don't have all 20 variables
a <- social_context3 %>%
  group_by(Description) %>%
  dplyr::summarise(count=n())
b <- a[a$count!=20,]
b
c <- a[a$count==20,1]
c

#Drop counties w/o all 20 variables
social_context3b <- social_context3[social_context3$Description %in% c$Description,]
social_context3b <- social_context3b[order(social_context3b$Description,social_context3b$Social_Context_Code),]

rownames(social_context3b) <- NULL


###REFORMAT COUNTY AND STATE VARIABLES TO MERGE ALL DATASETS###
northeast_sunroof$State.Abbreviation <- state.abb[match(northeast_sunroof$state_name,state.name)]
northeast_sunroof$Description <- str_c(northeast_sunroof$region_name,", ",northeast_sunroof$State.Abbreviation)
northeast_sunroof <- northeast_sunroof[c(-2)]
northeast_sunroof <- dplyr::rename(northeast_sunroof, "County.Name"="region_name")
northeast_sunroof <- northeast_sunroof[c(26,1,25,2:24)]

solar_data0 <- northeast_sunroof[c(1:7,13:16,22:26)]
solar_data0 <- solar_data0[order(solar_data0$Description),]
rownames(solar_data0) <- NULL

###ADDITIONAL TRANSFORMATIONS###
#Create percentages for demographic data
pop_dem_pct <- pop_demographics
pop_dem_pct[, -(1:3)] <- sweep(pop_dem_pct[, -(1:3)], 1, pop_dem_pct[, 3], "/")

#Reformat development metrics dataset
#transpose the dataset for first county
namelist <- unique(metrics_dev5$Code.Description)
t_metrics <- t(metrics_dev5[1:12,6])
colnames(t_metrics) <- namelist
metrics <- cbind(metrics_dev5[1,2:3],t_metrics)
#now loop over the rest of the counties and rbind them t_metrics_dev
for(i in 2:312){
  lower_row <- (12*i)-11
  upper_row <- 12*i
  t_temp0 <- t(metrics_dev5[lower_row:upper_row,6])
  colnames(t_temp0) <- namelist
  t_temp1 <- cbind(metrics_dev5[lower_row,2:3],t_temp0)
  metrics <- rbind(metrics,t_temp1)
}
#rename variables to shorter names
colnames(metrics) <- c("Description",
                       "Year",
                       "snap_benefits",
                       "pct_insured",
                       "prop_crimes",
                       "violent_crimes",
                       "net_migration_rate",
                       "pct_diploma",
                       "pct_bachelors",
                       "poverty_rate",
                       "pop_density",
                       "pct_single_parent",
                       "suicide_rate",
                       "pct_full_time"
                        )

#Reformat social context dataset
#transpose the dataset for first county
namelist2 <- unique(social_context3b$Social_Context_Code_Description)
t_social <- t(social_context3b[1:20,4])
colnames(t_social) <- namelist2
social_context <- cbind(social_context3b[1,1],t_social)
social_context <- as.data.frame(social_context)
social_context[c(2:21)] <- as.numeric(social_context[c(2:21)])
#now loop over the rest of the counties and rbind them t_metrics_dev
for(i in 2:261){
  lower_row <- (20*i)-19
  upper_row <- 20*i
  t_temp0 <- t(social_context3b[lower_row:upper_row,4])
  colnames(t_temp0) <- namelist2
  t_temp1 <- cbind(social_context3b[lower_row,1],t_temp0)
  t_temp1 <- as.data.frame(t_temp1)
  t_temp1[c(2:21)] <- as.numeric(t_temp1[c(2:21)])
  social_context <- rbind(social_context,t_temp1)
}
#rename variables to match format
social_context <- dplyr::rename(social_context,"Description"="V1")
rownames(social_context) <- NULL
social_context <- social_context[c(1,2,4,11,17,18,3,5)]

###JOIN EVERYTHING UP FOR FINAL DATASET###
solar_data1 <- merge(solar_data0,metrics)
solar_data2 <- merge(solar_data1,pop_dem_pct)
                     
###CALCULATE MORE VARIABLES###
solar_data2$pct_installed <- solar_data2$existing_installs_count/solar_data2$count_qualified
#fix these percentages to match the rest
solar_data2[c(31:50)]<-solar_data2[c(31:50)]*100
solar_data2[c(22)]<-solar_data2[c(22)]*100
#solar_data2b <- solar_data2[solar_data2$existing_installs_count>100,]

###LIMIT TO VARIABLES THAT WE'LL ACTUALLY USE
solar_data3 <- solar_data2[c(1,3,4,50,11,19,20,22,24,26,27,35,41,42)]

###MERGE SOCIAL CONTEXT AS WELL###
solar_data4 <- merge(solar_data3,social_context)
solar_data4[c(20)] <- solar_data4[c(20)]*100

#Drop Burleson County, TX doesn't have solar data
solar_data4 <- solar_data4[-12,]
rownames(solar_data4) <- NULL

##REMOVE EXTRA OBJECTS###
rm(pop_by_race,
   pop_by_race2,
   pop_by_race3,
   pop_dem_pct,
   pop_demographics,
   pop_by_age_sex,
   pop_by_age_sex2,
   pop_by_age_sex3)
rm(project_sunroof_county,
   solar_data0,
   solar_data1,
   solar_data3)
rm(social_context0,
   social_context1,
   social_context2,
   social_context3)
rm(metrics_dev1,
   metrics_dev2,
   metrics_dev3,
   metrics_dev4,
   metrics_dev5)
rm(t_metrics,
   t_social,
   t_temp0,
   t_temp1,
   i,
   lower_row,
   upper_row,
   namelist,
   namelist2)


