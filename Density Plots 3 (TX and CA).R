library(ggplot2)

p1 <- ggplot(solar_data5b, aes(`% Solar Panel Installed`)) +
  geom_density() + 
  ggtitle("% Solar Panel Installed") +
  xlab("%Solar Panel Installed") +
  ylab("Density") +
  theme_classic()

p2 <- ggplot(solar_data5b, aes(`Median KW Potential`)) +
  geom_density() + 
  ggtitle("Median KW Potential") +
  xlab("Median KW Potential") +
  ylab("Density") +
  theme_classic()

p3 <- ggplot(solar_data5b, aes(`% w/ Health Insurance`)) +
  geom_density() + 
  ggtitle("% w/ Health Insurance") +
  xlab("% w/ Health Insurance") +
  ylab("Density") +
  theme_classic()

p4 <- ggplot(solar_data5b, aes(`Property Crime Rate`)) +
  geom_density() + 
  ggtitle("Property Crime Rate") +
  xlab("Property Crime Rate") +
  ylab("Density") +
  theme_classic()

p5 <- ggplot(solar_data5b, aes(`% w/ Bachelor's Degree`)) +
  geom_density() + 
  ggtitle("% w/ Bachelor's Degree") +
  xlab("% w/ Bachelor's Degree") +
  ylab("Density") +
  theme_classic()

p6 <- ggplot(solar_data5b, aes(`log(Population Density)`)) +
  geom_density() + 
  ggtitle("log(Population Density)") +
  xlab("log(Population Density)") +
  ylab("Density") +
  theme_classic()

p7 <- ggplot(solar_data5b, aes(`Net Migration Rate`)) +
  geom_density() + 
  ggtitle("Net Migration Rate") +
  xlab("Net Migration Rate") +
  ylab("Density") +
  theme_classic()

p8 <- ggplot(solar_data5b, aes(`% Population Age 45-64`)) +
  geom_density() + 
  ggtitle("% Population Age 45-64") +
  xlab("% Population Age 45-64") +
  ylab("Density") +
  theme_classic()

p9 <- ggplot(solar_data5b, aes(`% Female`)) +
  geom_density() + 
  ggtitle("% Female") +
  xlab("% Female") +
  ylab("Density") +
  theme_classic()

p10 <- ggplot(solar_data5b, aes(`% White`)) +
  geom_density() + 
  ggtitle("% White") +
  xlab("% White") +
  ylab("Density") +
  theme_classic()

p11 <- ggplot(solar_data5b, aes(`Income per Capita`)) +
  geom_density() + 
  ggtitle("Income per Capita") +
  xlab("Income per Capita") +
  ylab("Density") +
  theme_classic()

p12 <- ggplot(solar_data5b, aes(`Entrepeneurship Score`)) +
  geom_density() + 
  ggtitle("Entrepeneurship Score") +
  xlab("Entrepeneurship Score") +
  ylab("Density") +
  theme_classic()

p13 <- ggplot(solar_data5b, aes(`Belief in Science Score`)) +
  geom_density() + 
  ggtitle("Belief in Science Score Score") +
  xlab("Belief in Science Score") +
  ylab("Density") +
  theme_classic()

p14 <- ggplot(solar_data5b, aes(`Risk Taking Score`)) +
  geom_density() + 
  ggtitle("Risk Taking Score") +
  xlab("Risk Taking Score") +
  ylab("Density") +
  theme_classic()  

p15 <- ggplot(solar_data5b, aes(`Religiosity Score`)) +
  geom_density() + 
  ggtitle("Religiosity Score") +
  xlab("Religiosity Score") +
  ylab("Density") +
  theme_classic()

p16 <- ggplot(solar_data5b, aes(`Income Mobility Score`)) +
  geom_density() + 
  ggtitle("Income Mobility Score") +
  xlab("Income Mobility Score") +
  ylab("Density") +
  theme_classic()

# p17 <- ggplot(solar_data5b, aes(`Employment Rate`)) +
#   geom_density() + 
#   ggtitle("Employment Rate") +
#   xlab("Employment Rate") +
#   ylab("Density") +
#   theme_classic()
# 
# p18 <- ggplot(solar_data5b, aes(`In Texas`)) +
#   geom_density() + 
#   ggtitle("County in Texas?") +
#   xlab("County in Texas?") +
#   ylab("Density") +
#   theme_classic()

###########################################
library(gridExtra)
g1 <- as_gtable(p1)
g2 <- as_gtable(p2)
g3 <- as_gtable(p3)
g4 <- as_gtable(p4)
g5 <- as_gtable(p5)
g6 <- as_gtable(p6)
g7 <- as_gtable(p7)
g8 <- as_gtable(p8)
g9 <- as_gtable(p9)
g10 <- as_gtable(p10)
g11 <- as_gtable(p11)
g12 <- as_gtable(p12)
g13 <- as_gtable(p13)
g14 <- as_gtable(p14)
g15 <- as_gtable(p15)
g16 <- as_gtable(p16)

grid.arrange(g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16,
             nrows=4, ncols=4)

library(ggpubr)
plotlist <- list(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16)
ggarrange(plotlist=plotlist,nrow=4,ncol=4)

library(cowplot)
plot_grid(plotlist, nrow=4)

