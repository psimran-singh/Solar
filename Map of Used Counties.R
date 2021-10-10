devtools::install_github("UrbanInstitute/urbnmapr")
library(urbnmapr)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(urbnmapr)
library(stringr)

ggplot() + 
  geom_polygon(data = urbnmapr::states, mapping = aes(x = long, y = lat, group = group),
               fill = "grey", color = "white") +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45)


all_counties <- left_join(countydata, counties, by = "county_fips")
all_counties$State.Abbreviation <- state.abb[match(all_counties$state_name,state.name)]
all_counties$Description <- str_c(all_counties$county_name,", ",all_counties$State.Abbreviation)

  
counties_used <- solar_data4[c(1)]
all_counties$solar_counties <- all_counties$Description %in% counties_used$Description

all_counties %>%
  ggplot(aes(long, lat, group = group, fill = solar_counties)) +
  geom_polygon(color = NA) +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
  labs(fill = "solar_counties") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
theme(axis.title.y=element_blank(),
      axis.text.y=element_blank(),
      axis.ticks.y=element_blank()) +
scale_fill_discrete(name = "", labels = c("Not Included", "Included")) +
theme(legend.position="bottom") +
ggtitle("Counties Included in Analysis") +
theme(plot.title = element_text(hjust = 0.5))
