#Packages
library(tidyverse)
library(statsr)
library(MuMIn)
library(dplyr)
library(GGally)
library(car)
library(bestglm)
library(stats)
library(boot)
library(lmtest)
library(MASS)
library(normtest)
library(emmeans)
library(dplyr)
library(ggplot2)
library(lmtest)

#read in the data
grazing <- read.csv("C://Users//Kaeli//Documents//HANPP//LRR_NPP_COUNTIES.csv", header = TRUE)

hanpp_land <- read.csv("C://Users//Kaeli//Documents//HANPP//HANPP_DataSet_LandEstimates.csv", 
                       header = TRUE)

hanpp_land_sheet1 <- read.csv("C://Users//Kaeli//Documents//HANPP//hanpp_dataset_land_estimate_sheet1.csv", 
                              header = TRUE)

hanpp_dataset <- read.csv("C://Users//Kaeli//Documents//HANPP//HANPP_DataSet.csv", header = TRUE)

#make dataset smaller and manageable
hanpp_land_small <- hanpp_land[1:6,]

library(reshape2)
hanpp_land_small <- melt(df, id.var = "")

#make the bar graphs
p <- ggplot(data=hanpp_land_small, aes(x = County, y = Total.HANPP.Harvest, fill = supp)) + 
  geom_bar(stat='identity', color = "black")
p

# installing/loading the latest installr package:
install.packages("Rtools")
install.packages("installr"); library(installr) # install+load installr
updateR()

#install newer data
grazing_final <- read.csv("C://Users//Kaeli//Downloads//LRR_NPP_COUNTIES.csv", header = T)

cotton_pima <- read.csv("C://Users//Kaeli//Downloads//Cottonpima_FINALHANPP.csv", header = T)

springdurum <- read.csv("C://Users//Kaeli//Downloads//springdurum_FINALHANPP.csv", header = T)

corn <- read.csv("C://Users//Kaeli//Downloads//corngrain_FINALHANPP.csv", header = T)

soybeans <- read.csv("C://Users//Kaeli//Downloads//Soybeans_FINALHANPP.csv", header = T)

#what crop is upland?
cotton_upland <- read.csv("C://Users//Kaeli//Downloads//upland_FINALHANPP.csv", header = T)

alfalfa <- read.csv("C://Users//Kaeli//Downloads//alfalfa_FINALHANPP.csv", header = T)

sorghum <- read.csv("C://Users//Kaeli//Downloads//sorghum_FINALHANPP.csv", header = T)

#Isolate the columns we need from all the datasets 

grazing_small <- data.frame(grazing$NAME_2, grazing$STATE_NA_1, grazing$HANPP_grazing)

cotton_pima_small <- data.frame(cotton_pima$Crops, cotton_pima$HANPPinTonnes, cotton_pima$stcnty)

springdurum_small <- data.frame(springdurum$Crops, springdurum$HANPPinTonnes, springdurum$stcnty)

corn_small <- data.frame(corn$Crops, corn$HANPPinTonnes, corn$stcnty)

soybeans_small <- data.frame(soybeans$Crops, soybeans$HANPPTonnes, soybeans$StCnty)

cotton_upland_small <- data.frame(cotton_upland$Crops, cotton_upland$HANPPinTonnes, cotton_upland$stcnty)

alfalfa_small <- data.frame(alfalfa$Crops, alfalfa$HANPPinTonnes, alfalfa$stcnty)

sorghum_small <- data.frame(sorghum$Crops, sorghum$HANPP.massinTonnes, sorghum$stcnty)

#Combine into one large dataset

cotton_pima_small$cotton_pima.stcnty <- as.character( )
total <- merge(cotton_pima_small, springdurum_small, by = "stcnty")
