import numpy as np
from scipy.stats import truncnorm
import random
import pandas as pd
import matplotlib.pyplot as plt
from scipy import stats  # For standard error calculation
# Set seed for reproducibility
np.random.seed(42)
# Define the parameters for truncated normal distribution
lower_bound = 0
upper_bound = 4
mean = 2.9
std_dev = 2
# Calculate a and b for truncnorm
a = (lower_bound - mean) / std_dev
b = (upper_bound - mean) / std_dev
# Generate GPA values
GPA = np.round(truncnorm.rvs(a, b, loc=mean, scale=std_dev,
size=20291), decimals=2)
# Generate other data
number = list(range(1, 20292))  # Student numbers
gender = np.random.binomial(1, 0.5, 20291)  # 1 = male, 0 = female (binary)
program_id = [random.randint(1, 10) for _ in range(20291)]  # Program IDs from 1 to 10
# Create DataFrame
student_list = pd.DataFrame({
"number": number,
"GPA": GPA,
"gender": gender,
"program_id": program_id
})
# Set sample parameters
num_samples = 1000
sample_size1 = 250
# Generate sample means
sample_means = []
for _ in range(num_samples):
    sample1 = student_list['GPA'].sample(n=sample_size1, replace=False)
    sample_means.append(np.mean(sample1))
# Plot histogram
plt.hist(sample_means, color='skyblue', edgecolor='black')
plt.xlabel('Mean GPA')
plt.ylabel('Frequency')
plt.title('Histogram of Sample Mean GPA')
plt.grid(axis='y', alpha=0.75)
# Show plot without blocking
plt.show()
standard_error = np.std(sample_means)
print("Standard Deviation = {}".format(standard_error))
import statistics
def calculate_margin_of_error(sample2):
    sample_std = statistics.stdev(sample2)  # Calculate sample standard deviation
    sample_size2 = len(sample2)
    z_score = 1.96
    margin_of_error = z_score * (sample_std / (sample_size2 * 0.5))
    return margin_of_error
sample_data = [10, 12, 8, 15, 9]
margin = calculate_margin_of_error(sample_data)
print("Margin of Error =", margin)

##10_7

data = [10, 12, 8, 15, 9]
# Sample size
n = len(data)
# Sample mean
mean_x = np.mean(data)
# Sample standard deviation (ddof=1 for sample std)
s = np.std(data, ddof=1)
# Standard error
SE = s / np.sqrt(n)
# Degrees of freedom
df = n - 1
# t-critical value for 95% confidence level
t_critical = stats.t.ppf(0.975, df)  # two-tailed
# Margin of Error
MOE = t_critical * SE
# Confidence interval
lower = mean_x - MOE
upper = mean_x + MOE
# Output the results
print(f"Sample mean: {mean_x:.2f}")
print(f"Sample Standard deviation: {s:.2f}")
print(f"Standard error: {SE:.2f}")
print(f"t-critical value: {t_critical:.3f}")
print(f"Margin of Error: {MOE:.2f}")
print(f"95% Confidence Interval: ({lower:.2f}, {upper:.2f})")

import scipy.stats as st
x = np.linspace(-4, 4, 500)
# Define degrees of freedom to plot
degrees_of_freedom = [1, 3, 8, 30, 1000]
# Create the plot
plt.figure(figsize=(10, 6))
# Plot t-distributions for different degrees of freedom
for df in degrees_of_freedom:
    t_dist = st.t.pdf(x, df)
    plt.plot(x, t_dist, label=f't-distribution (df={df})')
# Plot the standard normal distribution for comparison
normal_dist = st.norm.pdf(x)
plt.plot(x, normal_dist, label='Standard Normal Distribution',
linestyle='--')
# Add labels and title
plt.xlabel('x')
plt.ylabel('Probability Density')
plt.title('Plotting Different t-Distributions')
# Add legend and grid
plt.legend()
plt.grid(False)
# Show the plot
plt.show()

from scipy.stats import chi2
# Define the x values for the plot
x = np.linspace(0, 20, 500)
# Define the degrees of freedom to plot
degrees_of_freedom = [1, 3, 5, 7]
# Create the plot
plt.figure(figsize=(10, 6))
# Plot each chi-square density curve
for df in degrees_of_freedom:
    plt.plot(x, chi2.pdf(x, df), label=f'df = {df}')
# Add labels and title
plt.xlabel('x')
plt.ylabel('Density')
plt.title('Chi-Square Density Curves')
# Add legend
plt.legend()
# Show the plot
plt.grid(False)
plt.show()