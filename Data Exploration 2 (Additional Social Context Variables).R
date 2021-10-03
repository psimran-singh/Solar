#RUN DATA MANAGEMENT CODE FIRST
library(ggplot2)
library(dplyr)
library(gtsummary)
library(psych)
library(corrplot)
library(xtable)
library(knitr)

summary(solar_data4)

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
                            "Religiosity Score")

solar_data5 <- solar_data4b[c(4:19)]

principal(solar_data5)

solar_data5.cor = cor(solar_data5)
solar_data5.cor

jpeg("CorrPlot.jpeg", width = 10, height = 10, units = 'in', res = 300)
corrplot(solar_data5.cor,
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


solar.fa <- factanal(solar_data5,factors=2)
solar.fa


lm <- lm(prop_crimes ~ White.Alone + pct_bachelors + income_per_capita, data = solar_data5)
summary(lm)
