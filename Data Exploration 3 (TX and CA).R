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

summary(solar_data4)

#Making a Texas Variable
solar_data4$"In Texas" <- solar_data4$State.Abbreviation=="TX"

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

###Some last minute transformations to normalize our variables
solar_data5a <- solar_data5
skewness(solar_data5a$"Population Density")
solar_data5a$"log(Population Density)" <- log(solar_data5$"Population Density")
plot(density(solar_data5b$"Population Density"))

solar_data5b <- solar_data5a[c(1:6,8:18)]

##Statistic Tables
# skim1 <- skim(solar_data5a) 
# texas_data <- solar_data5b[solar_data5b$`In Texas`==TRUE,]
# cali_data <- solar_data5b[solar_data5b$`In Texas`==FALSE,]
# skim2 <- skim(texas_data)
# skim3 <- skim(cali_data)
# 
# write.xlsx(skim1, file = "results1a.xlsx")
# write.xlsx(skim2, file = "results_texas.xlsx")
# write.xlsx(skim3, file = "results_cali.xlsx")



# skewness(solar_data5$"% Solar Panel Installed")
# solar_data5b$"% Solar Panel Installed" <- (solar_data5$"% Solar Panel Installed")
# plot(density(solar_data5b$"% Solar Panel Installed"))

##Principal Components
pca <- prcomp(solar_data5b, center=TRUE, scale.=TRUE)
pca2 <- prcomp(solar_data5b, center=TRUE, scale.=TRUE, retx=TRUE)
pca
pca2
ggbiplot(pca)
ggbiplot(pca2)



pca2 <- principal(solar_data5b, rotate="none", nfactors=17, scores=TRUE)
pca3 <- principal(solar_data5b, rotate="varimax", nfactors=17, scores=TRUE)
pca2
pca3

#ScreePlots
qplot(c(1:17), pca2$values) + 
  geom_line() + 
  xlab("Principal Component") + 
  ylab("Variance Explained") +
  ggtitle("Scree Plot")

qplot(c(1:17), pca3$values) + 
  geom_line() + 
  xlab("Principal Component") + 
  ylab("Variance Explained") +
  ggtitle("Scree Plot")

#Correlation Matrix
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

#Factor Analysis
solar.fa <- factanal(solar_data5,factors=5)
solar.fa
summary(solar.fa)

lm <- lm(prop_crimes ~ White.Alone + pct_bachelors + income_per_capita, data = solar_data5)
summary(lm)
