x <- seq(-6, 6, length = 100)  
# Degrees of freedom  
df = c(1,4,10,30)  
colour = c("red", "orange", "green", "blue","black")  
# Plot a normal distribution  
plot(x, dnorm(x), type = "l", lty = 2, xlab = "t-value", ylab = "Density",   
     main = "Comparison of t-distributions", col = "black")  
# Add the t-distributions to the plot  
for (i in 1:4){  
  lines(x, dt(x, df[i]), col = colour[i])  
} 
# Add a legend  
legend("topright", c("df = 1", "df = 4", "df = 10", "df = 30", "normal"),   
       col = colour, title = "t-distributions", 
       lty = c(1,1,1,1,2))

library(ggplot2)  
# Create a data frame with x values and different degrees of freedom 
x <- seq(0, 150, by = 0.1) 
df_data <- data.frame( 
  x = rep(x, 3),  
  df = c(rep(5, length(x)), rep(100, length(x)), rep(20, length(x))) 
) 
# Calculate the density for each degree of freedom 
df_data$y <- dchisq(df_data$x, df = df_data$df) 
# Plot the curves with color differentiation 
ggplot(df_data, aes(x = x, y = y, color = factor(df))) +  
  geom_line() +  
  labs(title = "Chi-Square Distributions with Different Degrees of Freedom", 
       x = "Chi-Square Statistic",  
       y = "Density",  
       color = "Degrees of Freedom") 

## Practice

x <- seq(-4, 4, length = 100)  
# Degrees of freedom  
df = c(4,16,32)  
colour = c("red", "green", "blue","black")
plot(x, dnorm(x), type = "l", lty = 2, xlab = "t-value", ylab = "Density",   
     main = "Comparison of t-distributions", col = "black")  
# Add the t-distributions to the plot  
for (i in 1:3){  
  lines(x, dt(x, df[i]), col = colour[i])  
} 
# Add a legend  
legend("topright", c("df = 4", "df = 16", "df = 32", "normal"),   
       col = colour, title = "t-distributions", 
       lty = c(1,1,1,1,2))

x <- seq(0, 25, by = 0.1) 
df_data <- data.frame( 
  x = rep(x, 3),  
  df = c(rep(2, length(x)), rep(5, length(x)), rep(10, length(x))) 
) 
# Calculate the density for each degree of freedom 
df_data$y <- dchisq(df_data$x, df = df_data$df) 
# Plot the curves with color differentiation 
ggplot(df_data, aes(x = x, y = y, color = factor(df))) +  
  geom_line() +  
  labs(title = "Chi-Square Distributions with Different Degrees of Freedom", 
       x = "Chi-Square Statistic",  
       y = "Density",  
       color = "Degrees of Freedom") 