#Mann-Whitney U Test
x<-c(540,670,1000,960,1200,4650,4200)
y<-c(5000,4200,1300,900,7400,4500,7500)
wilcox.test(x, y, alternative = "two.sided", exact = TRUE)


##Kruskal-Wallis Test 
install.packages("ggpubr")
library("ggpubr")
library(openxlsx)

#Importing data
PlantGrowth<-PlantGrowth

write.xlsx(PlantGrowth, "C:\Users\andre\OneDrive\Desktop\School\PlantGrowth.xlsx")
head(PlantGrowth)

#Displaying group levels
levels(PlantGrowth$group)

#Reording levels
PlantGrowth$group <- ordered(PlantGrowth$group,levels = c("ctrl", "trt1", "trt2"))

#Loading the dplyr 
library(dplyr)

#Computing the summary statistics
group_by(PlantGrowth, group) %>%
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),
    sd = sd(weight, na.rm = TRUE),
    median = median(weight, na.rm = TRUE),
    IQR = IQR(weight, na.rm = TRUE)
  )

ggboxplot(PlantGrowth, x = "group", y = "weight",
          color = "group", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("ctrl", "trt1", "trt2"),
          ylab = "Weight", xlab = "Treatment")


#Add error bars
ggline(PlantGrowth, x = "group", y = "weight",
       add = c("mean_se", "jitter"),
       order = c("ctrl", "trt1", "trt2"),
       ylab = "Weight", xlab = "Treatment")

#Kruskal-Wallis Test to compare medians
kruskal.test(weight ~ group, data = PlantGrowth)

#Pairwise comparison
pairwise.wilcox.test(PlantGrowth$weight, PlantGrowth$group,
                     p.adjust.method = "BH")


## Wilcoxon signed rank test
library(MASS)
immerData<-immer
head(immer)


# Wilcoxon signed rank test with continuity correction 
wilcox.test(immer$Y1, immer$Y2, paired=TRUE) 
