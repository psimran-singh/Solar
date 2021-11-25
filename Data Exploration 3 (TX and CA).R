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
library(e1071)
library(ppcor)

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
skewness(solar_data5a$"Population Density") #8.23
solar_data5a$"log(Population Density)" <- log(solar_data5$"Population Density")
skewness(solar_data5a$"log(Population Density)") #0.39

plot(density(solar_data5a$"Population Density"))
plot(density(solar_data5a$`log(Population Density)`))

#Take the Square and Cube Root of % Solar Panel Installed
skewness(solar_data5a$`% Solar Panel Installed`) #1.73
solar_data5a$"(% Solar Panel Installed)^(1/3)" <- (solar_data5a$"% Solar Panel Installed")^(1/3)
solar_data5a$"(% Solar Panel Installed)^(1/2)" <- (solar_data5a$"% Solar Panel Installed")^(1/2)
skewness(solar_data5a$"(% Solar Panel Installed)^(1/3)") #0.51
skewness(solar_data5a$"(% Solar Panel Installed)^(1/2)") #0.94


plot(hist(solar_data5a$`% Solar Panel Installed`))
plot(hist(solar_data5a$`(% Solar Panel Installed)^(1/2)`))
plot(hist(solar_data5a$`(% Solar Panel Installed)^(1/3)`))

#%Solar Panel and Pop. Density
solar_data5og <- solar_data5a[c(1:17)]

#% Solar Panel and Log(Pop. Density)
solar_data5b <- solar_data5a[c(1:6,8:18)]

#(% Solar Panel)^(1/3) and Log(Pop. Density)
solar_data5cbrt <- solar_data5a[c(19,2:6,8:18)]

#(% Solar Panel)^(1/2) and Log(Pop. Density)
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

#Unchanged % Solar Panel and Unchanged Pop. Density Variable
pca1 <- principal(solar_data5og, rotate="none", nfactors=ncol(solar_data5og), scores=TRUE)
pca1

#Unchanged % Solar Panel and Log(Pop. Density) Variable
pca2 <- principal(solar_data5b, rotate="none", nfactors=ncol(solar_data5b), scores=TRUE)
pca3 <- principal(solar_data5b, rotate="varimax", nfactors=ncol(solar_data5b), scores=TRUE)
pca2
pca3

#Cube Root % Solar Panel Variable and Log(Pop. Density) Variable
pca4 <- principal(solar_data5cbrt, rotate="none", nfactors=ncol(solar_data5c), scores=TRUE)
pca5 <- principal(solar_data5cbrt, rotate="varimax", nfactors=ncol(solar_data5c), scores=TRUE)
pca4
pca5

#Square Root % Solar Panel Variable and Log(Pop. Density) Variable
pca6 <- principal(solar_data5sqrt, rotate="none", nfactors=ncol(solar_data5c), scores=TRUE)
pca7 <- principal(solar_data5sqrt, rotate="varimax", nfactors=ncol(solar_data5c), scores=TRUE)
pca8 <- principal(solar_data5sqrt, rotate="oblimin", nfactors=ncol(solar_data5c), scores=TRUE)
pca6
pca7
pca8

solar_dataPCA <- cbind(solar_data4b,pca6$scores)
solar_dataPCA <- solar_dataPCA[c(1:28)]



#ScreePlots
qplot(c(1:17), pca6$values) + 
  geom_line() + 
  xlab("Principal Component") + 
  ylab("Variance Explained") +``
  ggtitle("Scree Plot")


### Correlation Matrix
solar_data5sqrt.cor = cor(solar_data5sqrt)
solar_data5sqrt.cor

solar_data5sqrt.ppcor = pcor(solar_data5sqrt)
solar_data5sqrt.ppcor

jpeg("CorrPlot4.jpeg", width = 10, height = 10, units = 'in', res = 300)
corrplot(solar_data5sqrt.cor,
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

jpeg("PCorrPlot.jpeg", width = 10, height = 10, units = 'in', res = 300)
corrplot(solar_data5sqrt.ppcor$estimate,
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
         order="AOE")
dev.off()

#Factor Analysis
parallel<-fa.parallel(solar_data5sqrt, fm='minres', fa='fa',show.legend = FALSE)

solar.paf1 <- fa(solar_data5sqrt,fm="pa")
solar.paf1

solar.paf2 <- fa(solar_data5sqrt,fm="pa",nfactors=7)
solar.paf2

solar.paf3 <- fa(solar_data5sqrt,fm="pa",nfactors=5)
solar.paf3

solar.paf4 <- fa(solar_data5sqrt,fm="pa",nfactors=4)
solar.paf4

solar.paf5 <- fa(solar_data5sqrt,fm="pa",nfactors=4,rotate="varimax")
solar.paf5

solar.paf5 <- fa(solar_data5sqrt,fm="pa",nfactors=4,rotate="oblimin")
solar.paf5

solar.paf6 <- fa(solar_data5sqrt,fm="pa",nfactors=3)
solar.paf6


solar_dataPAF <- cbind(solar_data4b,solar.paf4$scores)
solar_dataPAF

write.csv(solar_dataPAF,"PAF_Scores.csv")
write.csv(solar_dataPCA,"PCA_Scores.csv")


solar_PCALoadings <- pca6$loadings
write.csv(solar_PCALoadings,"PCA_Loadings.csv")

solar_PCAEigenValues <- pca6$Vaccounted
write.csv(solar_PCAEigenValues,"PCA_Eigenvalues.csv")

solar_PPCOR <- solar_data5sqrt.ppcor$estimate
write.csv(solar_PPCOR,"PPCOR.csv")

