set.seed(25)
times = rexp(1000, 2)
threshold = 1/12
head(60*times)
mean(times)
x <- seq(0, max(times), by = 0.01)
lambda = 2
pdf = lambda*exp(-lambda*x)
plot(x, pdf, type = "l", 
     xlab = "Time between calls (hours)", 
     ylab = "Density", 
     main = "Exponential Distribution (λ = 2)")
abline(v = 1/lambda, col = "red", lty = 2)
points(0, lambda, col = "blue", pch = 19)
text(0, lambda + 0.1, "λ = 2", col = "blue", pos = 3)

probability <- pexp(5/60, rate =2)  
print(probability)
count_less_than_5min = sum(times<threshold)
prob_less_than_5min = (count_less_than_5min/length(times))


## 9_23
set.seed(53)
n <- 100  # Number of trials in each sample 
N<-200 
p <- 0.5  # Probability of success 
sample <- rbinom(N, n, p) 
hist(sample, breaks = 20, main = "Distribution of Samples", xlab = "Number of Successes")
mean(sample)
var(sample)
sd(sample)
pbinom(48, size = 100, prob = 0.5)
pnorm(48.5,mean(sample),sd(sample))


## 9_25
set.seed(123) 
n <- 100          
p <- 0.3          
num_samples <- 1000  
samples <- matrix(rbinom(n * num_samples, size = 1, prob = p), nrow = num_samples, ncol = n) 
sample_means <- rowMeans(samples) 
hist(sample_means, breaks = 20, 
     main = "Sampling Distribution of Sample Means", 
     xlab = "Sample Mean (Proportion of Successes)", col = "skyblue", border = "black")
n <- 10 
p <- 0.3 
mu <- n * p 
sigma <- sqrt(n * p * (1 - p)) 
z <- (4.5 - mu) / sigma 
prob <- 1 - pnorm(z) 
cat("Approximate probability that the sample mean > 0.4:", 
    round(prob, 4), "\n")

set.seed(123)
lambda <- 3          
n <- 50               
num_samples <- 100 
samples <- replicate(num_samples, rexp(n, rate = lambda)) 
sample_means <- colMeans(samples) 
head(sample_means)
hist(sample_means,  
     breaks = 15,  
     col = "skyblue",  
     main = "Sampling Distribution of Sample Means\n(Exponential Waiting Time)", 
     xlab = "Sample Mean Waiting Time (hours)", 
     border = "white") 
abline(v = 1 / lambda, col = "red", lwd = 2, lty = 2) 
legend("topright", legend = "True Mean = 0.33", col = "red", 
       lty = 2, lwd = 2)  
(0.4-.33)/sqrt(.002)

lambda <- 3 
mu <- 1 / lambda 
sigma <- 1 / lambda 
n <- 50 
threshold <- 24 / 60  # convert minutes to hours 
# Standard error 
se <- sigma / sqrt(n) 
# Calculate z-score 
z <- (threshold - mu) / se 
# Calculate probability P(sample mean > 0.4 hours) 
prob <- 1 - pnorm(z) 
cat(sprintf("Probability that sample mean > 24 minutes (0.4 hours): %.4f\n", prob))


