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

alpha_level<-0.05 
n<-10000 
st_dev<-107.9
#Calculate lower and upper critical values  
c_l<-sqrt((n-1)/qchisq(alpha_level/2,n-1,lower.tail=FALSE)) 
c_u<-sqrt((n-1)/qchisq(alpha_level/2,n-1,lower.tail=TRUE)) 
# calculate lower and upper confidence interval for sd 
a<-st_dev*c_l 
b<-st_dev*c_u 
cat("The 95% CI for the population standard deviation 
is","(", paste(round(a), sep = ""),",", paste(round(b), sep = ""),")",".","\n")

## B=A U B/A, P(B)=P(A)+P(B/A), hence P(a)< or = P(B)
1-pnorm(500,524.5,107.9)
z<-(500-mean(GMATScores))/sd(GMATScores) 
z
1-pnorm(z,0,1)
score<- mean(GMATScores) + qnorm(0.95)*sd(GMATScores) 
score 
