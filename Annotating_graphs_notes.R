library(ggplot2)
p <-ggplot(faithful, aes(x =eruptions,y=waiting)) +
  geom_point()
p +
  annotate("text", x=3, y=48,label="Group1") +
  annotate("text", x=4.5, y=66, label="Group2")
p +
  #Normal
  annotate("text", x=3, y=48,label="Group1",alpha =.1) +
  #Overplotted
  geom_text(x= 4.5,y= 66,label= "Group2", alpha=.1)
p +
  annotate("text", x=-Inf, y=Inf, label="Upperleft",hjust=-.2, vjust =2) +
  annotate("text", x= mean(range(faithful$eruptions)),y =-Inf, vjust=-0.4,
           label= "Bottommiddle")
# Anormalcurve
x <-ggplot(data.frame(x= c(-3,3)), aes(x= x)) +
  stat_function(fun= dnorm)
x +
  annotate("text", x=2, y=0.3, parse=TRUE,
           label= "frac(1, sqrt(2 * pi)) * e ^ {-x^2 / 2}")
x + annotate("text", x=0, y=0.05, parse = TRUE, size= 4,
           label= "'Function: '*y==frac(1, sqrt(2*pi))*e^{-x^2/2}")

library(gcookbook) # Load gcookbook for the heightweight data set
library("gridExtra")
hw_plot <- ggplot(heightweight, aes(x = ageYear, y = heightIn, colour = sex)) +
  geom_point()
# Add horizontal and vertical lines
plotA<-hw_plot +
  geom_hline(yintercept = 60) +geom_vline(xintercept = 14)
# Add angled line
plotB<-hw_plot + geom_abline(intercept = 37.4, slope = 1.75)
grid.arrange(plotA, plotB,nrow = 1, ncol = 2)

library(dplyr)
hw_means <-heightweight %>% group_by(sex) %>% summarise(heightIn = mean(heightIn))
hw_plot +
  geom_hline(data= hw_means,aes(yintercept=heightIn,colour= sex),
             linetype ="dashed",size =1)

library(gcookbook) #Loadgcookbookfortheclimatedataset
p <-ggplot(filter(climate,Source == "Berkeley"), aes(x= Year,y= Anomaly10y)) +
  geom_line()
p +annotate("segment",x= 1950,xend =1980,y =-.25,yend=-.25)

library(grid)
p + annotate("segment",x =1850,xend=1820, y=-.8, yend=-.95,
             colour ="blue",size=2,arrow= arrow()) +
  annotate("segment", x=1950, xend=1980,y=-.25,yend=-.25,
           arrow= arrow(ends= "both",angle =90,length= unit(.2,"cm")))

p <-ggplot(filter(climate,Source == "Berkeley"), aes(x= Year,y= Anomaly10y)) +
  geom_line()
p +annotate("rect",xmin= 1950,xmax =1980,ymin =-1,ymax=1,
            alpha= .1,fill= "blue")

pg_mod <-PlantGrowth %>%
  mutate(hl= recode(group,"ctrl" = "no", "trt1"="no","trt2"= "yes"))
ggplot(pg_mod, aes(x=group,y=weight,fill= hl)) +
  geom_boxplot() + scale_fill_manual(values= c("grey85","#FFDDCC"),guide= FALSE)

ce_mod <-cabbage_exp %>%filter(Cultivar == "c39")
# Withabargraph
plotA<-ggplot(ce_mod, aes(x= Date,y= Weight)) + geom_col(fill="white",colour ="black") +
  geom_errorbar(aes(ymin= Weight-se,ymax= Weight + se),width= .2)
#Withalinegraph
plotB<-ggplot(ce_mod, aes(x= Date,y= Weight)) + geom_line(aes(group= 1)) +
  geom_point(size= 4) +
  geom_errorbar(aes(ymin= Weight-se,ymax= Weight + se),width= .2)
grid.arrange(plotA, plotB,nrow= 1,ncol= 2)