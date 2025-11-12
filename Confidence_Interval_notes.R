install.packages("truncnorm") 
library(truncnorm) 
set.seed(25) 
GMATScores <- round(rtruncnorm(10000, a = 200, b =800 , mean = 527, sd = 112)) 
head(GMATScores) 
summary(GMATScores) 
round(sd(GMATScores))
plot(density(GMATScores))
m<-mean(GMATScores)
s<-sd(GMATScores)
##z=x-mean/std. dev.
z<-(GMATScores -m)/s
head(z)
plot(density(z))
hist(GMATScores)
boxplot(GMATScores, main="Boxplot of GMAT Scores", ylab="GMAT Scores") 
boxplot.stats(GMATScores)$out
result <- t.test(GMATScores, conf.level = 0.95)
confidence_interval <- result$conf.int 
cat("The 95% CI for the population mean is","(", paste(round(confidence_interval), sep = ""),")",".","\n")