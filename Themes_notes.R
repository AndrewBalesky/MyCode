data(Salaries, package= "carData")
p <-ggplot(Salaries, aes(x =rank, fill=sex)) +geom_bar() +
  facet_wrap(~discipline) +
  labs(title= "Academic Rank by Gender and Discipline",x="Rank",y="Frequency",fill= "Gender")
p

p + theme(text= element_text(color= "navy"),
          panel.background= element_rect(fill="white"),
          panel.grid.major.y= element_line(color="grey"),
          panel.grid.minor.y= element_line(color="grey",linetype= "dashed"),
          panel.grid.major.x= element_blank(),
          panel.grid.minor.x= element_blank(),
          strip.background= element_rect(fill="white", color="grey"))

t <-ggplot(mpg, aes(x =displ,y=hwy,color= class)) +
  geom_point(size= 3,alpha =.5) +
  labs(title= "Mileage by engine displacement",subtitle ="Data from 1999 and 2008",
       caption = "Source:EPA(http://fueleconomy.gov)",
       x= "Engine displacement (litres)",y ="Highway miles per gallon",
       color= "CarClass")
t
library(ggthemes)
t + theme_economist()

t + theme_fivethirtyeight()
