library(HistData)
nightingale = Nightingale
head(nightingale) 
tail(nightingale) 
str(nightingale) 
View(nightingale) 
library(tidyverse)
glimpse(nightingale)

nightingale$TotalDeath = nightingale$Disease+nightingale$Wounds+nightingale$Other
View(nightingale)

dataset1 <-data.frame(
  ID= 1:5,
  gender= c("male", "male","female","female", "nonbinary"),
  height= c(71,73,64,64, 66),
  weight= c(175, 225,130,125,165))
dataset2 <-tibble(
  ID= 1:5,
  gender= c("male", "male","female","female", "nonbinary"),
  height= c(71,73,64,64, 66),
  weigh= c(175, 225,130,125,165))
glimpse(dataset1)
summary(dataset2)
