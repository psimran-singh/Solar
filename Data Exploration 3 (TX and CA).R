#RUN DATA MANAGEMENT CODE FIRST
library(ggplot2)
library(dplyr)
library(gtsummary)
library(psych)
library(corrplot)
library(xtable)
library(knitr)
library(ggbiplot)

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
                           "Rural/Urban Score",
                           "% w/ Bachelor's Degree",
                           "Population Density",
                           "% Children w/ Single Parent",
                           "% Population Age 45-64",
                           "% Female",
                           "% White",
                           "Income per Capita",
                           "Entrepeneurship Score",
                           "Belief in Science Score",
                           "Risk Taking Score",
                           "Religiosity Score",
                           "Income Mobility Score",
                           "Employment Rate",
                           "In Texas")

solar_data5 <- solar_data4b[c(4:7,9:20,22)]

###Some last minute transformations to normalize our variables
solar_data5b <- solar_data5
skewness(solar_data5b$"Population Density")
solar_data5b$"Population Density" <- log(solar_data5$"Population Density")
plot(density(solar_data5b$"Population Density"))

skewness(solar_data5$"% White")
solar_data5b$"% White" <- (solar_data5$"% White")^(0.5)
plot(density(solar_data5b$"% White"))

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



pca2 <- principal(solar_data5, rotate="none", nfactors=17, scores=TRUE)
pca3 <- principal(solar_data5, rotate="varimax", nfactors=17, scores=TRUE)
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
