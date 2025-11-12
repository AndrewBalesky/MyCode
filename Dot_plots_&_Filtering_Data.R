library(nycflights13)
library(tidyverse)
alaska_flights<-flights%>%
  filter(carrier=="AS")
alaska_flights
site<-"https://aokine.github.io/Data/Poplar3.csv"
poplar<-read.csv(file =url(site))
head(poplar,n=5)
summary(poplar)
poplarC <- read.csv(file = url(site), na.strings = "-99",colClasses =c(rep("factor", 3),
                                                                       rep("numeric", 3), "factor"))
str(poplarC)
poplarC$site<-factor(poplarC$site, labels = c("Moist", "Dry"))
TreatmentLevels<-c("Control","Fertilizer","Irrigation","FertIrriga")
poplarC$Treatment<-factor(poplarC$treatment, labels=TreatmentLevels)
str(poplarC)
library(ggplot2)
ggplot(data =poplarC,mapping= aes(x =diameter, y=height)) +
  geom_point()
ggplot(data =poplarC,mapping= aes(x =diameter, y=height,color= treatment)) +
  geom_point() +
  theme_bw() +
  geom_smooth(se = FALSE)
ggplot(data =poplarC,mapping= aes(x =diameter, y=height,color= treatment)) +
  geom_point() +
  theme_bw() +
  geom_smooth(se = FALSE) +
  facet_grid(cols= vars(age),rows = vars(site))

library(tidyverse)
site<-"https://aokine.github.io/Data/berkeley.csv"
berkdata<-read_csv(file=url(site))
glimpse(berkdata)
head(berkdata, n = 10)
table(berkdata)
table(berkdata$status)
prop.table(table(berkdata$status))
statusTab<-table(berkdata$status)
prop.table(statusTab)
round(prop.table(statusTab),4)
library(tidyverse) # or library(dplyr)
berkdata %>% count(status)
berkdata%>%
  count(status)%>%
  mutate(prop=prop.table(n))
berkdata%>%
  count(department)%>%
  arrange(desc(n))%>% #sortedbydescending departmentsizen
  mutate(prop =prop.table(n),
         cum_count=cumsum(n),
         cum_prop =cumsum(prop))

## Two Way Table
table(berkdata$sex, berkdata$status)
prop.table(table(berkdata$sex,berkdata$status),1)
berkdata %>% count(sex, status)
berkdata%>%
  group_by(sex)%>% #performcalculationswithineachsex
  count(status)%>% #countacceptedandrejectedstudents
  mutate(prop=prop.table(n))
table(berkdata$sex,berkdata$department)
table(berkdata$status,berkdata$department)
round(prop.table(table(berkdata$sex,berkdata$department),2),4)
berkdata%>%
  group_by(sex)%>%
  summarize(prop_accept =mean(status=="accepted"))
table(berkdata$sex,berkdata$status=="accepted")




## categorical data
library(tidyverse)
site<-"https://aokine.github.io/Data/STT3850majors.csv"
students<-read_csv(file=url(site))
glimpse(students)
students %>% count(AY)
students %>% count(BannerMajor)
students%>%
  count(CodedMajor)%>% 
  mutate(percents=100 *prop.table(n))

students %>%
  group_by(AY) %>%
  count(CodedMajor) %>%
  mutate(percents =100 * prop.table(n)) %>%
  filter(CodedMajor == "Mathematical Sciences")
students%>%
  count(Year)%>%
  mutate(percents=100 *prop.table(n))

students%>%
  count(CodedMajor, Year)%>%
  filter(CodedMajor=="Mathematical Sciences")%>%
  arrange(desc(n))

students<-students%>%
  mutate(Year=factor(Year,levels=c(
                       "Freshman", "Sophomore", "Junior", "Senior", "Graduate Certificate Program")))
glimpse(students) ##Year is now a Factor instead of Character

studentsA <- students %>%
  mutate(
    Year = factor(Year,
                  levels = c(
                    "Freshman",
                    "Sophomore",
                    "Junior",
                    "Senior",
                    "Graduate Certificate Program")),
    CodedMajor = factor(CodedMajor,
                    levels = c(
                          "Computer Science",
                          "Mathematical Sciences",
                          "Other Sciences",
                          "Other")))
studentsA %>% count(Year)
studentsB <- students %>%
  mutate(Year = factor(Year,
                       levels = c("Freshman",
                                  "Sophomore",
                                  "Junior",
                                  "Senior",
                                  "Graduate Certificate Program"),
                       labels = c("FR",
                                  "SO",
                                  "JR",
                                  "SR",
                                  "GR")))
studentsB %>% count(Year)

library(tidyverse)#or library(forcats)
studentsD<-studentsA%>%
  mutate(CodedMajor2=fct_recode(CodedMajor,
                                "Math"="Mathematical Sciences",
                                "NotMath"="Computer Science",
                                "NotMath"="Other Sciences",
                                "NotMath"="Other"))
glimpse(studentsD$CodedMajor2)
