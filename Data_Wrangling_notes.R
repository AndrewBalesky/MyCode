site<-"https://aokine.github.io/Data/galtondata.csv"
galtondata<-read.csv(file=url(site))
head(galtondata)

library(dplyr)
galtondataA<-galtondata %>%
  mutate(MotherT=1.08 * Mother)
galtondataA <- galtondataA %>%
  mutate(HeightT = if_else(Child == "Daughter", 1.08 * Height, Height))
galtondataA <- galtondataA %>%
  mutate(Midparent = (Father + MotherT) / 2)
galtondataA
galton_daughters<-galtondata %>%
  filter(Child =="Daughter")
head(galton_daughters,n=5)
galton_sons<-galtondata %>%
  filter(Child =="Son")
head(galton_sons,n=5)
galton_shortermoms<-galtondata %>%
  filter(Mother < 60)
head(galton_shortermoms,n=5)
galton_shorterdads = galtondata %>%
  filter(Father < 60)
dim(galton_shorterdads)

galton_daughters_with_shorter_moms<-galtondata %>%
  filter(
    Child=="Daughter",
    Mother< 60
  )
dim(galton_daughters_with_shorter_moms)

galtondata%>%
  group_by(Child) %>%
  summarize(mean_ht=mean(Height),
            sd_ht= sd(Height),
            count= n())

freq_children<-galtondata %>%
  group_by(Children) %>%
  summarize(freq = n())
freq_children %>%
  arrange(desc(freq))