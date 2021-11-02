library(ggplot2)

p1 <- ggplot(solar_data4, aes(pct_installed)) +
  geom_density() + 
  ggtitle("% Solar Panel Installed") +
  xlab("%Solar Panel Installed") +
  ylab("Density") +
  theme_classic()

p2 <- ggplot(solar_data4, aes(kw_median)) +
  geom_density() + 
  ggtitle("Median KW Potential") +
  xlab("Median KW Potential") +
  ylab("Density") +
  theme_classic()

p3 <- ggplot(solar_data4, aes(pct_insured)) +
  geom_density() + 
  ggtitle("% w/ Health Insurance") +
  xlab("% w/ Health Insurance") +
  ylab("Density") +
  theme_classic()

p4 <- ggplot(solar_data4, aes(prop_crimes)) +
  geom_density() + 
  ggtitle("Property Crime Rate") +
  xlab("Property Crime Rate") +
  ylab("Density") +
  theme_classic()

p5 <- ggplot(solar_data4, aes(rural_urban_score)) +
  geom_density() + 
  ggtitle("Rural/Urban Score") +
  xlab("Rural/Urban Score") +
  ylab("Density") +
  theme_classic()

p6 <- ggplot(solar_data4, aes(pct_bachelors)) +
  geom_density() + 
  ggtitle("% w/ Bachelor's Degree") +
  xlab("% w/ Bachelor's Degree") +
  ylab("Density") +
  theme_classic()

p7 <- ggplot(solar_data4, aes(pop_density)) +
  geom_density() + 
  ggtitle("Population Density") +
  xlab("Population Density") +
  ylab("Density") +
  theme_classic()

p8 <- ggplot(solar_data4, aes(pct_single_parent)) +
  geom_density() + 
  ggtitle("% of Children w/ Single Parent") +
  xlab("% of Children w/ Single Parent") +
  ylab("Density") +
  theme_classic()

p9 <- ggplot(solar_data4, aes(Population.45.64)) +
  geom_density() + 
  ggtitle("% Population Age 45-64") +
  xlab("% Population Age 45-64") +
  ylab("Density") +
  theme_classic()

p10 <- ggplot(solar_data4, aes(Female.Population)) +
  geom_density() + 
  ggtitle("% Female") +
  xlab("% Female") +
  ylab("Density") +
  theme_classic()

p11 <- ggplot(solar_data4, aes(White.Alone)) +
  geom_density() + 
  ggtitle("% White") +
  xlab("% White") +
  ylab("Density") +
  theme_classic()

p12 <- ggplot(solar_data4, aes(`Income Per Capita`)) +
  geom_density() + 
  ggtitle("Income per Capita") +
  xlab("Income per Capita") +
  ylab("Density") +
  theme_classic()

p13 <- ggplot(solar_data4, aes(`Entrepreneurship`)) +
  geom_density() + 
  ggtitle("Entrepeneurship Score") +
  xlab("Entrepeneurship Score") +
  ylab("Density") +
  theme_classic()

p14 <- ggplot(solar_data4, aes(`Belief In Science`)) +
  geom_density() + 
  ggtitle("Belief in Science Score Score") +
  xlab("Belief in Science Score") +
  ylab("Density") +
  theme_classic()

p15 <- ggplot(solar_data4, aes(`Risk Taking`)) +
  geom_density() + 
  ggtitle("Risk Taking Score") +
  xlab("Risk Taking Score") +
  ylab("Density") +
  theme_classic()  

p16 <- ggplot(solar_data4, aes(`Religiosity`)) +
  geom_density() + 
  ggtitle("Religiosity Score") +
  xlab("Religiosity Score") +
  ylab("Density") +
  theme_classic()

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

