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

p12 <- ggplot(solar_data4, aes(income_per_capita)) +
  geom_density() + 
  ggtitle("Income per Capita") +
  xlab("Income per Capita") +
  ylab("Density") +
  theme_classic()

p13 <- ggplot(solar_data4, aes(entrepeneurship)) +
  geom_density() + 
  ggtitle("Entrepeneurship Score") +
  xlab("Entrepeneurship Score") +
  ylab("Density") +
  theme_classic()

p14 <- ggplot(solar_data4, aes(belief_in_science)) +
  geom_density() + 
  ggtitle("Belief in Science Score Score") +
  xlab("Belief in Science Score") +
  ylab("Density") +
  theme_classic()

p15 <- ggplot(solar_data4, aes(risk_taking)) +
  geom_density() + 
  ggtitle("Risk Taking Score") +
  xlab("Risk Taking Score") +
  ylab("Density") +
  theme_classic()  

p16 <- ggplot(solar_data4, aes(religiosity)) +
  geom_density() + 
  ggtitle("Religiosity Score") +
  xlab("Religiosity Score") +
  ylab("Density") +
  theme_classic()
