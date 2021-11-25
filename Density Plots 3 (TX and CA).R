library(ggplot2)

p1 <- ggplot(solar_data5a, aes(`% Solar Panel Installed`)) +
  geom_density() + 
  ggtitle("% Solar Panel Installed") +
  xlab("%Solar Panel Installed") +
  ylab("Density") +
  theme_classic()

p2 <- ggplot(solar_data5a, aes(`Median KW Potential`)) +
  geom_density() + 
  ggtitle("Median KW Potential") +
  xlab("Median KW Potential") +
  ylab("Density") +
  theme_classic()

p3 <- ggplot(solar_data5a, aes(`% w/ Health Insurance`)) +
  geom_density() + 
  ggtitle("% w/ Health Insurance") +
  xlab("% w/ Health Insurance") +
  ylab("Density") +
  theme_classic()

p4 <- ggplot(solar_data5a, aes(`Property Crime Rate`)) +
  geom_density() + 
  ggtitle("Property Crime Rate") +
  xlab("Property Crime Rate") +
  ylab("Density") +
  theme_classic()

p5 <- ggplot(solar_data5a, aes(`% w/ Bachelor's Degree`)) +
  geom_density() + 
  ggtitle("% w/ Bachelor's Degree") +
  xlab("% w/ Bachelor's Degree") +
  ylab("Density") +
  theme_classic()

p6 <- ggplot(solar_data5a, aes(`Population Density`)) +
  geom_density() + 
  ggtitle("Population Density") +
  xlab("Population Density") +
  ylab("Density") +
  theme_classic()

p7 <- ggplot(solar_data5a, aes(`Net Migration Rate`)) +
  geom_density() + 
  ggtitle("Net Migration Rate") +
  xlab("Net Migration Rate") +
  ylab("Density") +
  theme_classic()

p8 <- ggplot(solar_data5a, aes(`% Population Age 45-64`)) +
  geom_density() + 
  ggtitle("% Population Age 45-64") +
  xlab("% Population Age 45-64") +
  ylab("Density") +
  theme_classic()

p9 <- ggplot(solar_data5a, aes(`% Female`)) +
  geom_density() + 
  ggtitle("% Female") +
  xlab("% Female") +
  ylab("Density") +
  theme_classic()

p10 <- ggplot(solar_data5a, aes(`% White`)) +
  geom_density() + 
  ggtitle("% White") +
  xlab("% White") +
  ylab("Density") +
  theme_classic()

p11 <- ggplot(solar_data5a, aes(`Income per Capita`)) +
  geom_density() + 
  ggtitle("Income per Capita") +
  xlab("Income per Capita") +
  ylab("Density") +
  theme_classic()

p12 <- ggplot(solar_data5a, aes(`Entrepeneurship Score`)) +
  geom_density() + 
  ggtitle("Entrepeneurship Score") +
  xlab("Entrepeneurship Score") +
  ylab("Density") +
  theme_classic()

p13 <- ggplot(solar_data5a, aes(`Belief in Science Score`)) +
  geom_density() + 
  ggtitle("Belief in Science Score Score") +
  xlab("Belief in Science Score") +
  ylab("Density") +
  theme_classic()

p14 <- ggplot(solar_data5a, aes(`Risk Taking Score`)) +
  geom_density() + 
  ggtitle("Risk Taking Score") +
  xlab("Risk Taking Score") +
  ylab("Density") +
  theme_classic()  

p15 <- ggplot(solar_data5a, aes(`Religiosity Score`)) +
  geom_density() + 
  ggtitle("Religiosity Score") +
  xlab("Religiosity Score") +
  ylab("Density") +
  theme_classic()

p16 <- ggplot(solar_data5a, aes(`Income Mobility Score`)) +
  geom_density() + 
  ggtitle("Income Mobility Score") +
  xlab("Income Mobility Score") +
  ylab("Density") +
  theme_classic()

#####################

p17 <- ggplot(solar_data5a, aes(`(% Solar Panel Installed)^(1/2)`)) +
  geom_density() +
  ggtitle("(% Solar Panel Installed)^(1/2)") +
  xlab("(% Solar Panel Installed)^(1/2)") +
  ylab("Density") +
  theme_classic()

p18 <- ggplot(solar_data5a, aes(`(% Solar Panel Installed)^(1/3)`)) +
  geom_density() +
  ggtitle("(% Solar Panel Installed)^(1/3)") +
  xlab("(% Solar Panel Installed)^(1/3)") +
  ylab("Density") +
  theme_classic()

p19 <- ggplot(solar_data5a, aes(`log(Population Density)`)) +
  geom_density() +
  ggtitle("log(Population Density") +
  xlab("log(Population Density") +
  ylab("Density") +
  theme_classic()

###########################################


library(ggpubr)
plotlist <- list(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16)
ggarrange(plotlist=plotlist,nrow=4,ncol=4)

plotlist2 <- list(p1, p17)
ggarrange(plotlist=plotlist2,nrow=1,ncol=2)

plotlist3 <- list(p6, p19)
ggarrange(plotlist=plotlist3,nrow=1,ncol=2)


