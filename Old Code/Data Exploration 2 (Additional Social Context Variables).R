#RUN DATA MANAGEMENT CODE FIRST
library(ggplot2)
library(dplyr)
library(gtsummary)
library(psych)
library(corrplot)
library(xtable)
library(knitr)
library(pastecs)
library(xlsx)
library(ggbiplot)

summary(solar_data4)

solar_data4c <- solar_data4
summary(solar_data4c)
data_desc <- stat.desc(solar_data4)
#rename columns later

solar_data5c <- solar_data4c[c(4:5,7,9,12:15,17,18,21,22,23,24,25,27,28,29,30,33,34)]

#Principal Components Analysis
pca1 <- prcomp(solar_data5c)
print(pca1)
ggbiplot(pca1)
summary(pca1)

#Correlation matrix
solar_data5c.cor = cor(solar_data5c)
solar_data5c.cor

jpeg("CorrPlot2.jpeg", width = 10, height = 10, units = 'in', res = 300)
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
solar.fa <- factanal(solar_data5c,factors=5)
solar.fa


lm <- lm(prop_crimes ~ White.Alone + pct_bachelors + income_per_capita, data = solar_data5)
summary(lm)
