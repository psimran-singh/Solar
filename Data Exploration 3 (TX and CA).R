#RUN DATA MANAGEMENT CODE FIRST
library(ggplot2)
library(dplyr)
library(gtsummary)
library(psych)
library(corrplot)
library(xtable)
library(knitr)
library(ggbiplot)
library(skimr)
library(Hmisc)
library(xlsx)
library(GPArotation)

### Check the Initial dataset created in Data Management 3 File
summary(solar_data4)

### Making a Texas Variable
solar_data4$"In Texas" <- solar_data4$State.Abbreviation=="TX"

### Rename Columns
solar_data4b <- solar_data4
colnames(solar_data4b) <- c("Description",
                           "County Name",
                           "State",
                           "% Solar Panel Installed",
                           "Median KW Potential",
                           "% w/ Health Insurance",
                           "Property Crime Rate",
                           "Net Migration Rate",
                           "% w/ Bachelor's Degree",
                           "Population Density",
                           "% Children w/ Single Parent",
                           "% Population Age 45-64",
                           "% Female",
                           "% White",
                           "Entrepeneurship Score",
                           "Income per Capita",
                           "Belief in Science Score",
                           "Risk Taking Score",
                           "Religiosity Score",
                           "Income Mobility Score",
                           "Employment Rate",
                           "In Texas")

solar_data5 <- solar_data4b[c(4:10,12:20,22)]

### Some last minute transformations to normalize our variables
solar_data5a <- solar_data5

#Take the Log of Population Density
skewness(solar_data5a$"Population Density")
solar_data5a$"log(Population Density)" <- log(solar_data5$"Population Density")

plot(density(solar_data5a$"Population Density"))
plot(density(solar_data5a$`log(Population Density)`))

#Take the Square and Cube Root of % Solar Panel Installed
skewness(solar_data5a$`% Solar Panel Installed`)
solar_data5a$"(% Solar Panel Installed)^(1/3)" <- (solar_data5a$"% Solar Panel Installed")^(1/3)
solar_data5a$"(% Solar Panel Installed)^(1/2)" <- (solar_data5a$"% Solar Panel Installed")^(1/2)

plot(hist(solar_data5a$`% Solar Panel Installed`))
plot(hist(solar_data5a$`(% Solar Panel Installed)^(1/2)`))
plot(hist(solar_data5a$`(% Solar Panel Installed)^(1/3)`))

solar_data5b <- solar_data5a[c(1:6,8:18)]

solar_data5cbrt <- solar_data5a[c(19,2:6,8:18)]
solar_data5sqrt <- solar_data5a[c(20,2:6,8:18)]

### Statistic Tables
skim1 <- skim(solar_data5a)
texas_data <- solar_data5a[solar_data5a$`In Texas`==TRUE,]
cali_data <- solar_data5a[solar_data5a$`In Texas`==FALSE,]
skim2 <- skim(texas_data)
skim3 <- skim(cali_data)

write.xlsx(skim1, file = "results1a.xlsx")
write.xlsx(skim2, file = "results_texas.xlsx")
write.xlsx(skim3, file = "results_cali.xlsx")

rm(skim1,skim2,skim3)


### Principal Components Analyses

#Unchanged % Solar Panel Variable
pca2 <- principal(solar_data5b, rotate="none", nfactors=ncol(solar_data5b), scores=TRUE)
pca3 <- principal(solar_data5b, rotate="varimax", nfactors=ncol(solar_data5b), scores=TRUE)
pca2
pca3
#Cube Root % Solar Panel Variable
pca4 <- principal(solar_data5cbrt, rotate="none", nfactors=ncol(solar_data5c), scores=TRUE)
pca5 <- principal(solar_data5cbrt, rotate="varimax", nfactors=ncol(solar_data5c), scores=TRUE)
pca4
pca5
#Square Root % Solar Panel Variable
pca6 <- principal(solar_data5sqrt, rotate="none", nfactors=ncol(solar_data5c), scores=TRUE)
pca7 <- principal(solar_data5sqrt, rotate="varimax", nfactors=ncol(solar_data5c), scores=TRUE)
pca6
pca7

#ScreePlots
qplot(c(1:17), pca4$values) + 
  geom_line() + 
  xlab("Principal Component") + 
  ylab("Variance Explained") +
  ggtitle("Scree Plot")


### Correlation Matrix
solar_data5b.cor = cor(solar_data5b)
solar_data5b.cor

jpeg("CorrPlot2.jpeg", width = 10, height = 10, units = 'in', res = 300)
corrplot(solar_data5b.cor,
         type="full",
         method="shade",
         addCoef.col = TRUE,
         tl.cex=1,
         tl.col="black",
         number.cex=.75,
         number.digits=2,
         sig.level=TRUE,
         cl.cex=1,
         tl.srt=45,
         addgrid.col="black",
         order="FPC")
dev.off()

solar_data5c.cor = cor(solar_data5c)
solar_data5c.cor

jpeg("CorrPlot3.jpeg", width = 10, height = 10, units = 'in', res = 300)
corrplot(solar_data5c.cor,
         type="full",
         method="shade",
         addCoef.col = TRUE,
         tl.cex=1,
         tl.col="black",
         number.cex=.75,
         number.digits=2,
         sig.level=TRUE,
         cl.cex=1,
         tl.srt=45,
         addgrid.col="black",
         order="FPC")
dev.off()

#Factor Analysis
solar.paf1 <- fa(solar_data5c,nfactors=3)
solar.paf1

solar.paf2 <- fa(solar_data5c,nfactors=6)
solar.paf2
summary(solar.paf2)

solar.paf3 <- fa(solar_data5c,nfactors=6,rotate="varimax")
solar.paf3

qplot(c(1:17), solar.paf2$e.values) + 
  geom_line() + 
  xlab("Principal Component") + 
  ylab("Variance Explained") +
  ggtitle("Scree Plot")

qplot(c(1:17), solar.paf3$e.values) + 
  geom_line() + 
  xlab("Principal Component") + 
  ylab("Variance Explained") +
  ggtitle("Scree Plot")

#Iterative Approach


lm <- lm(prop_crimes ~ White.Alone + pct_bachelors + income_per_capita, data = solar_data5)
summary(lm)
