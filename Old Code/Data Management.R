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
  project_sunroof_county$state_name=="New York" |
  project_sunroof_county$state_name=="Pennsylvania" |
  project_sunroof_county$state_name=="New Jersey" |
  project_sunroof_county$state_name=="Connecticut" |
  project_sunroof_county$state_name=="Rhode Island" |
  project_sunroof_county$state_name=="Massachusetts" |
  project_sunroof_county$state_name=="Maryland" |
  project_sunroof_county$state_name=="Delaware" |
  project_sunroof_county$state_name=="New Hampshire" |
  project_sunroof_county$state_name=="Vermont" |
  project_sunroof_county$state_name=="Maine" |
  project_sunroof_county$state_name=="North Carolina" |
  project_sunroof_county$state_name=="South Carolina" |
  project_sunroof_county$state_name=="Georgia" |
  project_sunroof_county$state_name=="Florida" |
  project_sunroof_county$state_name=="California" |
  project_sunroof_county$state_name=="Nevada" |
  project_sunroof_county$state_name=="Arizona" |
  project_sunroof_county$state_name=="New Mexico",
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
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', MA',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', MD',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', DE',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', NH',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', VT',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', ME',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', NC',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', SC',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', GA',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', FL',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', CA',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', NV',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', AZ',pop_by_race2$Description)))
pop_by_race3 <- rbind(pop_by_race3, dplyr::filter(pop_by_race2,grepl(', NM',pop_by_race2$Description)))


pop_by_age_sex2 <- subset(pop_by_age_sex,
                   pop_by_age_sex$Year=="2019",
                   select=c(1:17))

pop_by_age_sex3 <- data.frame()
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', NY',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', NJ',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', PA',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', CT',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', RI',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', MA',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', MD',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', DE',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', NH',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', VT',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', ME',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', NC',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', SC',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', GA',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', FL',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', CA',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', NV',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', AZ',pop_by_age_sex2$Description)))
pop_by_age_sex3 <- rbind(pop_by_age_sex3, dplyr::filter(pop_by_age_sex2,grepl(', NM',pop_by_age_sex2$Description)))


pop_demographics <- merge(pop_by_age_sex3,pop_by_race3)
pop_demographics <- pop_demographics[c(4:25)]


metrics_dev2 <- subset(metrics_dev1,
                 metrics_dev1$Year=="2019",
                 select=c(1:8))

metrics_dev3 <- data.frame()
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', NY',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', NJ',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', PA',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', CT',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', RI',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', MA',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', MD',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', DE',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', NH',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', VT',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', ME',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', NC',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', SC',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', GA',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', FL',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', CA',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', NV',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', AZ',metrics_dev2$Description)))
metrics_dev3 <- rbind(metrics_dev3, dplyr::filter(metrics_dev2,grepl(', NM',metrics_dev2$Description)))



social_context1 <- data.frame()
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', NY',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', NJ',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', PA',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', CT',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', RI',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', MA',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', MD',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', DE',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', NH',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', VT',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', ME',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', NC',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', SC',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', GA',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', FL',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', CA',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', NV',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', AZ',social_context0$Description)))
social_context1 <- rbind(social_context1, dplyr::filter(social_context0,grepl(', NM',social_context0$Description)))


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
#urban-rural continuum score
metrics_dev5 <- rbind(metrics_dev5, metrics_dev4[metrics_dev4$M4D_Code==15000,])
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
  summarise(count=n())
b <- a[a$count!=20,]
b
c <- a[a$count==20,1]
c

#Drop counties w/o all 20 variables
social_context3 <- social_context3[social_context3$Description %in% c$Description,]

###REFORMAT COUNTY AND STATE VARIABLES TO MERGE ALL DATASETS###
northeast_sunroof$State.Abbreviation <- state.abb[match(northeast_sunroof$state_name,state.name)]
northeast_sunroof$Description <- str_c(northeast_sunroof$region_name,", ",northeast_sunroof$State.Abbreviation)
northeast_sunroof <- northeast_sunroof[c(-2)]
northeast_sunroof <- rename(northeast_sunroof, "County.Name"="region_name")
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
for(i in 2:739){
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
                       "rural_urban_score",
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
namelist2 <- unique(social_context3$Social_Context_Code_Description)
t_social <- t(social_context3[1:20,4])
colnames(t_social) <- namelist2
social_context <- cbind(social_context3[1,1],t_social)
social_context <- as.data.frame(social_context)
social_context[c(2:21)] <- as.numeric(social_context[c(2:21)])
#now loop over the rest of the counties and rbind them t_metrics_dev
for(i in 2:711){
  lower_row <- (20*i)-19
  upper_row <- 20*i
  t_temp0 <- t(social_context3[lower_row:upper_row,4])
  colnames(t_temp0) <- namelist2
  t_temp1 <- cbind(social_context3[lower_row,1],t_temp0)
  t_temp1 <- as.data.frame(t_temp1)
  t_temp1[c(2:21)] <- as.numeric(t_temp1[c(2:21)])
  social_context <- rbind(social_context,t_temp1)
}
#rename variables to match format
social_context <- rename(social_context,"Description"="V1")

###JOIN EVERYTHING UP FOR FINAL DATASET###
solar_data1 <- merge(solar_data0,metrics)
solar_data2 <- merge(solar_data1,pop_dem_pct)
                     
###CALCULATE MORE VARIABLES###
solar_data2$pct_installed <- solar_data2$existing_installs_count/solar_data2$count_qualified
#fix these percentages to match the rest
solar_data2[c(31:50)]<-solar_data2[c(31:50)]*100
solar_data2b <- solar_data2[solar_data2$existing_installs_count>100,]

###LIMIT TO VARIABLES THAT WE'LL ACTUALLY USE
solar_data3 <- solar_data2b[c(1,3,4,50,11,19,20,22,24,26,27,35,41,42)]

###MERGE SOCIAL CONTEXT AS WELL###
solar_data4 <- merge(solar_data3,social_context)

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


