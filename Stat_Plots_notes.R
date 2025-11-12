library(tidyverse)
site<-"https://aokine.github.io/Data/berkeley.csv"
berkdata<-read_csv(file= url(site))
library(ggplot2)
ggplot(berkdata, aes(x=sex, fill = status)) + geom_bar(position = "dodge") + 
  labs(title = "Berkeley Grad School Applicants F73", subtitle = "Six Largest Departments Only",
       x= "Applicant Sex", caption = "source:berkeley.csvdataset")

dept_tab<-count(berkdata,department)
ggplot(dept_tab,aes(x=department,y=n))+
  geom_col()+
  labs(y= "count")
ggplot(berkdata,aes(x=sex,fill=status))+
  geom_bar(color="black") + 
  scale_fill_manual(values= c("#FFC20A","#0C7BDC")) +
  labs(title="Berkeley Grad Applicants Fall 1973",
       subtitle="Six Largest Departments",
       x="Sex of Applicant",y="Number of Applicants",
       caption="source:berkeley.csvdataset") + 
  facet_grid(~ department)

mytable<-table(berkdata$sex)
lbls<-paste(names(mytable),"\n",mytable,sep="")
pie(mytable,labels = lbls,
    main="Pie Chart of Applicant Sex")

## 9_24
site<-"https://aokine.github.io/Data/gasmileage.csv"
mileage<-read_csv(file= url(site))
site<-"https://aokine.github.io/Data/oldfaithful.csv"
geyser<-read_csv(file = url(site))
site<-"https://aokine.github.io/Data/Bangladesh.csv"
wells<-read_csv(file= url(site))

glimpse(mileage)
glimpse(geyser)
glimpse(wells)
ggplot(mileage, aes(mpg)) +
  geom_histogram()
ggplot(mileage,aes(x=mpg))+
  geom_histogram(fill="orange",color="white") +
  geom_freqpoly(color="blue")
geyser<-geyser %>%
  mutate(group= ifelse(erupt_time< 3.1,"short","long"))
ggplot(geyser,aes(x=erupt_time,fill=group)) +
  geom_histogram(color="white")
ggplot(wells, aes(x=Arsenic))+
  geom_histogram(fill="orange",color="white")
ggplot(mileage,aes(x=mpg))+
  geom_histogram(binwidth=1,fill="orange", color="black")
ggplot(mileage,aes(x=mpg))+
  geom_histogram(aes(y=..density..), binwidth = .5, fill="green", color = "black") + 
  geom_density(color = "black")
ggplot(geyser,aes(x=erupt_time)) +
  geom_histogram(aes(y=..density..),fill="orange", color = "black")+
  geom_density(color="blue")

ggplot(mileage,aes(x=mpg))+
  geom_histogram(aes(y=..density..),bins=15,color="white")+
  geom_density(fill= "lightblue",color="blue",alpha=0.50)+
  labs(title="Distribution of Gas Mileage Test Values,n=100")

ggplot(mileage,aes(x=mpg))+
  geom_density(color="black",fill="lightblue")+
  stat_ecdf(color="blue") +
  geom_vline(xintercept=quantile(mileage$mpg, .5))

library("gridExtra")
library(grid)

plotA <- ggplot(mileage, aes(x = mpg)) +
  geom_histogram(bins = 15)
plotB <- ggplot(mileage, aes(x = mpg)) +
  geom_density()
plotC <- ggplot(mileage, aes(x = mpg)) +
  geom_boxplot() +
  labs(y = "")# helps with spacing here
plotD <- ggplot(mileage, aes(x = mpg)) +
  stat_ecdf()
plotE <- ggplot(mileage, aes(y = mpg)) +
  geom_boxplot()

grid.arrange(plotA, plotB,plotC, plotD,nrow =2,ncol =2,
             top= textGrob("GraphicalAnalysisofMilesper Gallon"))
grid.arrange(plotA, plotB,plotC, plotD,ncol = 3,
             top= textGrob("GraphicalAnalysisofMilesper Gallon"))

## 9_26
site<-"https://aokine.github.io/Data/happyf.csv"
happyf<-read_csv(file = url(site))
summary(mileage)
LF = fivenum(mileage$mpg)[2]-1.5*IQR(mileage$mpg)
UF = fivenum(mileage$mpg)[4] +1.5 *IQR(mileage$mpg)
ggplot(mileage,aes(x=mpg, y = .5))+
  geom_boxplot(fill = "skyblue")+ 
  scale_y_continuous(breaks=NULL) +
  labs(title="Fuel Efficiency for 100 Vehicle Road Tests",
       x="Miles Per Gallon",
       y=NULL,
       caption="source: gasmileage.csvdataset")

ggplot(wells, aes(x=Arsenic))+
  geom_boxplot()+
  scale_y_continuous(breaks=NULL) +
  labs(title="Arsenic Levels in 271 Sampled Wells in Bangladesh",
       x="Parts Per Billion",
       y=NULL,
       caption="Source: Bangladesh.csvdataset")

site<-"https://aokine.github.io/Data/happyf.csv"
happyf<-read_csv(file = url(site))
ggplot(happyf,aes(x=TipPct,y=Message)) +
  geom_boxplot()+
  theme_classic()+
  labs(title="Comparison of Tip Percentages",
       x="Tip(Percent of check)",
       y="Drawing on Back of Check")

p<-ggplot(happyf,aes(x=Message,y=TipPct)) +
  geom_violin(aes(fill = "lightblue"))+
  theme_classic()+
  labs(title="ComparisonofTipPercentages",
       y="Tip as a Percentage of the Check",
       x="Drawing on Back of Check") +
  facet_grid(.~ Sex)
p + geom_boxplot(width=0.1, aes(fill = "darkblue"))
  