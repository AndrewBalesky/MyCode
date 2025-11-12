##9/8
probabilities <- dbinom(x = c(0:6), size = 6, prob = 1 /5)  
data.frame(x = c(0:6),probabilities)  
plot(0:6, probabilities,xlab="Number of Customers", type = "l")
pbinom(5, size = 6, prob = 1 / 5)  
plot(0:6, pbinom(0:6, size = 6, prob = 1 / 5), type = "l")

##9/9
set.seed(25) 
random_data <- rbinom(n = 1000000, size = 5, prob = 0.3) 
head(random_data, n=20)
summary(random_data)
var(random_data)
options(scipen=999)#suppressing standard form in R 
hist(random_data)

##Poisson Distribution
set.seed(25) 
horse_kick_death <- rpois(1000000,0.61)
mean(horse_kick_death)
var(horse_kick_death)
