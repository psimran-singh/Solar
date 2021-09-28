setwd("~/Rutgers Fall 2021/Theory and Practice of Public Informatics/")

library(dplyr)
library(tidyverse)
library(readr)

###IMPORT DATA FILES###
apred1 <- read.csv("Solar Data Files/StatsAmerica Datasets/APRED/APRED - Disaster Resilience - Counties.csv")

###LIMIT ALL DATASETS TO SELECT STATES AND YEARS###
apred2 <- subset(apred1,
                 apred$Year=="2019",
                 select=c(1:11))

apred3 <- subset(apred2, apred2$State.Abbreviation=='NJ' |
                   apred2$State.Abbreviation=='NY' |
                   apred2$State.Abbreviation=='CT' |
                   apred2$State.Abbreviation=='PA' |
                   apred2$State.Abbreviation=='RI',
                 select=c(1:11))

###REFORMAT COUNTY AND STATE VARIABLES TO MERGE ALL DATASETS###
apred3$County.Name <- str_c(apred3$Description, " County")
apred3 <- apred3[c(-3)]
apred3$Description <- str_c(apred3$County.Name,", ",apred3$State.Abbreviation)
apred3 <- apred3[c(12,11,3,4:10)]

###ADDITIONAL TRANSFORMATIONS###

rm(apred1,apred2)
