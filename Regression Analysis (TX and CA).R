#RUN DATA MANAGEMENT CODE FIRST
library(ggplot2)
library(dplyr)
library(MASS)
library(jtools)
library(lm.beta)
library(stargazer)

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
solar_data5a$"log(Population Density)" <- log(solar_data5$"Population Density")

#Take the Square and Cube Root of % Solar Panel Installed
solar_data5a$"(% Solar Panel Installed)^(1/3)" <- (solar_data5a$"% Solar Panel Installed")^(1/3)
solar_data5a$"(% Solar Panel Installed)^(1/2)" <- (solar_data5a$"% Solar Panel Installed")^(1/2)

#Convert Income to $10k unit
solar_data5a$`Income per Capita` <- solar_data5a$`Income per Capita`/10000

#(% Solar Panel)^(1/2) and Log(Pop. Density)
solar_data5sqrt <- solar_data5a[c(1,20,2:6,8:18)]
solar_data6 <- solar_data5sqrt[c(3:18)]

### Principal Components Analyses
#Square Root % Solar Panel Variable and Log(Pop. Density) Variable
pca6 <- principal(solar_data6, rotate="none", nfactors=ncol(solar_data6), scores=TRUE)
pca6

loadings <- as.data.frame.matrix(pca6$loadings[,1:6])
loadings
write.csv(x = loadings, file = "pca_loadings.csv")

solar_dataPCA <- cbind(solar_data5sqrt,pca6$scores)
solar_dataPCA <- solar_dataPCA[c(1:28)]

#----------------------------------------------------------------------------------------#

### Regression Runs ###

#Full Model
Model1 <- lm(solar_data5sqrt$`(% Solar Panel Installed)^(1/2)` ~ 
               solar_data5sqrt$`Median KW Potential` +
               solar_data5sqrt$`Property Crime Rate` +
               solar_data5sqrt$`Net Migration Rate` +
               solar_data5sqrt$`Entrepeneurship Score` +
               solar_data5sqrt$`Income per Capita` +
               solar_data5sqrt$`Belief in Science Score` +
               solar_data5sqrt$`Risk Taking Score` +
               solar_data5sqrt$`Religiosity Score` +
               solar_data5sqrt$`Income Mobility Score` +
               solar_data5sqrt$`In Texas` +
               solar_data5sqrt$`log(Population Density)` +
               solar_data5sqrt$`% w/ Health Insurance` +
               solar_data5sqrt$`% w/ Bachelor's Degree` +
               solar_data5sqrt$`% Population Age 45-64` +
               solar_data5sqrt$`% Female` +
               solar_data5sqrt$`% White`)
Model1b <- lm.beta(Model1)

Model1List <- list(Model1$coefficients, Model1b$standardized.coefficients)

Model1_Output <- stargazer(Model1, Model1b,
          coef = Model1List,
          title="Enter Model - All Variables",
          type = "text",
          float = TRUE,
          report = "vcsp*",
          no.space = FALSE,
          header=FALSE,
          # align=TRUE,
          single.row = F,
          font.size = "small",
          intercept.bottom = F,
          digits = 2,
          t.auto = F,
          p.auto = F,
          notes.align = "l",
          notes.append = TRUE)#,
         # out="test.tex")

writeClipboard(Model1_Output)

# quick and dirty workaround for removing backticks  
remove_backticks = function(text){
  text = gsub("([^A-z]+)`", "\\1", text, perl = TRUE)
  text = gsub("`([^A-z]+)", "\\1", text, perl = TRUE)
  text = gsub("(^`)|(`$)", "", text, perl = TRUE)
  text
}


Model1_Output = remove_backticks(Model1_Output)
Model1_Output

#Step-Wise Regression Model
qchisq(0.05, 1, lower.tail = F)
reg1_stepwise2=step(Model1,direction = "backward",trace = T,k=3.8)
summary(reg1_stepwise2)



#PCA Run
Model3 <- lm(solar_dataPCA$`(% Solar Panel Installed)^(1/2)` ~
               solar_dataPCA$PC1 +
               solar_dataPCA$PC2 +
               solar_dataPCA$PC3 +
               solar_dataPCA$PC4 +
               solar_dataPCA$PC5 +
               solar_dataPCA$PC6)
summary(Model3)
