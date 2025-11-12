install.packages("bayess") 
library(bayess) 
set.seed(25) 
#Simulating GPA 
GPA<-round(truncnorm(20291,2.9, 2, 0, 4),digits=2) 
#Simulating student number 
number<-seq(1,20291) 
gender <- rbinom(n = 20291, size = 1, prob = 0.5)  
gender <- ifelse(gender==1, "F", "M") 
program_id <- sample(1:10, 20291,replace=TRUE) 
student_list<-data.frame(number, GPA, gender, program_id) 
num_samples<-1000 
sample_means <- rep(NA, num_samples)
for (i in 1:num_samples) { 
  sampled_gpa <- sample(student_list$GPA, size = 20, replace = FALSE) 
  sample_means[i] <- mean(sampled_gpa)  # Calculate sample mean 
  }
hist(sample_means, main = "Histogram of Sample Means", xlab = "GPA")
sd(sample_means)
for (i in 1:num_samples) { 
  sampled_gpa <- sample(student_list$GPA, size = 250, replace = FALSE) 
  sample_means[i] <- mean(sampled_gpa)  # Calculate sample mean 
} 
hist(sample_means, main = "Histogram of Sample Means", xlab = 
       "GPA")
sd(sample_means)

## 10_7

data <- c(10, 12, 8, 15, 9) 
n <- length(data) 
mean_x <- mean(data)
s <- sd(data) 
SE <- s / sqrt(n) 
df <- n - 1 
# t-critical value for 95% confidence level 
t_critical <- qt(0.975, df)  # 0.975 for two-tailed 95% 
# Margin of error 
MOE <- t_critical * SE 
# Confidence interval 
lower <- mean_x - MOE 
upper <- mean_x + MOE 
# Output the results 
cat("Sample mean:", mean_x, "\n") 
cat(" Sample Standard deviation:", s, "\n") 
cat("Standard error:", SE, "\n") 
cat("t-critical value:", t_critical, "\n") 
cat("Margin of Error:", MOE, "\n") 
cat("95% Confidence Interval: (", lower, ",", upper, ")\n")
