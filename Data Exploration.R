#RUN DATA MANAGEMENT CODE FIRST
library(ggplot2)
library(dplyr)
library(gtsummary)
library(psych)

summary(solar_data4)

with(solar_data2, plot(pct_installed,White.Alone))
with(solar_data2, plot(pct_installed,poverty_rate))
with(solar_data2, plot(pct_full_time,pct_installed))

with(solar_data2, plot(White.Alone, pct_qualified_real))
with(solar_data2, plot(Population.55.,pct_qualified_real))
with(solar_data2, plot(pct_full_time,pct_qualified_real))

solar_data5 <- solar_data4[c(4:18)]
solar_data5$income_per_capita <- as.numeric(solar_data5$income_per_capita)

principal(solar_data5)

solar_data5.cor = cor(solar_data5)
solar_data5.cor


correlations <- cov2cor(covariances)
fa.parallel(correlations, n.obs=112, fa="both", n.iter=100,
              main="Scree plots with parallel analysis")
