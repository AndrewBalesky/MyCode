x <- c(3, 7, 11, 0, 7, 0, 4, 5, 6, 2) 
hist(x)
qqnorm(x) 
qqline(x)
t.test(x, mu = 3, alternative = "greater")
sd(x)
mean(x)

women_weight <- c(38.9, 61.2, 73.3, 21.8, 63.4, 64.6, 48.4, 
                  48.8, 48.5) 
men_weight <- c(67.8, 60, 63.4, 76, 89.4, 73.3, 67.3, 61.3, 
                62.4)  
# Create a data frame 
my_data <- data.frame(  
  group = rep(c("Women", "Men"), each = 9), 
  weight = c(women_weight,  men_weight) 
) 
# Print all data 
print(my_data)
install.packages("dplyr") 
library(dplyr) 
#Compute summary statistics by groups 
group_by(my_data, group) %>% 
  summarise( 
    count = n(), 
    mean = mean(weight, na.rm = TRUE), 
    sd = sd(weight, na.rm = TRUE) 
  )
install.packages("ggpubr") 
library("ggpubr") 
ggboxplot(my_data, x = "group", y = "weight",  
          color = "group", palette = c("#00AFBB", "#E7B800"), 
          ylab = "Weight", xlab = "Groups") 
with(my_data, shapiro.test(weight[group == "Men"]))
with(my_data, shapiro.test(weight[group == "Women"]))
res.ftest <- var.test(weight ~ group, data = my_data) 
res.ftest
res <- t.test(women_weight, men_weight, conf.level = 0.99, var.equal = TRUE) 
res


before <-c(200.1, 190.9, 192.7, 213, 241.4, 196.9, 172.2,185.5, 
           205.2, 193.7) 
after <-c(392.9, 393.2, 345.1, 393, 434, 427.9, 422, 
          383.9,392.3, 352.2) 
my_data <- data.frame(  
  group = rep(c("before", "after"), each = 10),  
  weight = c(before, after) 
) 
print(my_data)
group_by(my_data, group) %>% 
  summarise( 
    count = n(), 
    mean = mean(weight, na.rm = TRUE), 
    sd = sd(weight, na.rm = TRUE) 
  ) 

install.packages("PairedData") 
before <- subset(my_data,  group == "before", weight, 
                 drop = TRUE) 
after <- subset(my_data,  group == "after", weight, 
                drop = TRUE) 
library(PairedData) 
pd <- paired(before, after) 
plot(pd, type = "profile") + theme_classic()

d <- with(my_data,  
          weight[group == "before"] - weight[group == "after"]) 
# Shapiro-Wilk normality test for the differences 
shapiro.test(d)
res <- t.test(before, after, paired = TRUE) 
res 

##chi-squared
flavors <- c(22,30,23) 
res <- chisq.test(flavors, p = c(1/3, 1/3, 1/3)) 
res

Contintable=matrix(c(50,125,90,45,75,175,30,10),ncol=2)  
colnames(Contintable)=c("Snacks","No Snacks")  
rownames(Contintable)=c("Action","Comedy","Family", "Horror") 
Contintable
library("gplots")  
#convert the data as a table  
dt <- as.table(as.matrix(Contintable))  
#Graph  
balloonplot(t(dt), main ="Purchase", xlab ="", ylab="", label = 
              FALSE, show.margins = FALSE)
chisq<-chisq.test(Contintable) 
chisq

set.seed(123)  # for reproducibility 
women_weight <- c(38.9, 61.2, 73.3, 21.8, 63.4, 64.6, 48.4, 48.8, 48.5) 
men_weight <- c(67.8, 60, 63.4, 76, 89.4, 73.3, 67.3, 61.3, 62.4) 
n_boot <- 10000 
diff_means <- numeric(n_boot) 
for (i in 1:n_boot) { 
  sample_women <- sample(women_weight, length(women_weight), 
                         replace = TRUE) 
  sample_men <- sample(men_weight, length(men_weight), replace = 
                         TRUE) 
  diff_means[i] <- mean(sample_men) - mean(sample_women) 
}
ci <- quantile(diff_means, c(0.025, 0.975)) 
ci
obs_diff <- mean(men_weight) - mean(women_weight) 
obs_diff


hist(diff_means, 
     main = "Bootstrap Distribution of Difference in Means", 
     xlab = "Mean(Men) - Mean(Women)", 
     col = "skyblue", border = "white") 
abline(v = mean(men_weight) - mean(women_weight), col = "red", 
       lwd = 2) 
abline(v = quantile(diff_means, c(0.025, 0.975)), col = 
         "darkgreen", lwd = 2, lty = 2) 
legend("topright", legend = c("Observed Diff", "95% CI"),  
       col = c("red", "darkgreen"), lty = c(1,2), bty = "n")

set.seed(123)  # for reproducibility 
library(boot) 
women_weight <- c(38.9, 61.2, 73.3, 21.8, 63.4, 64.6, 48.4, 
                  48.8, 48.5) 
men_weight <- c(67.8, 60, 63.4, 76, 89.4, 73.3, 67.3, 61.3, 
                62.4) 
# Combine data 
data <- data.frame( 
  weight = c(women_weight, men_weight), 
  group = rep(c("Women", "Men"), each = 9) 
) 
# Function for difference in means 
boot_diff <- function(data, indices) { 
  d <- data[indices, ] 
  mean(d$weight[d$group == "Men"]) - mean(d$weight[d$group == 
                                                     "Women"]) 
} 
# Bootstrap resampling (10,000 iterations) 
bootstrap <- boot(data = data, statistic = boot_diff, R = 10000) 
# Function to find the bootstrap Confidence Intervals 
boot.ci(boot.out = bootstrap, 
        type = c("norm", "basic", "perc", "bca"))