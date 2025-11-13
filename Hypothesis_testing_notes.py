import pylab
import scipy.stats as stats
measurements = [3, 7, 11, 0, 7, 0, 4, 5, 6, 2]
stats.probplot(measurements, dist="norm", plot=pylab)
pylab.show()

pop_mean = 3
# Perform the one-sample t-test
t_statistic, p_value = stats.ttest_1samp(measurements, pop_mean,
alternative='greater')
# Adjust p-value for one-tailed test
p_value_one_tail = p_value
print("T-statistic:", t_statistic)
print("P-value:", p_value)
#Check for significance
alpha = 0.05
if p_value < alpha:
    print("Reject null hypothesis")
else:
    print("Fail to reject null hypothesis")

import numpy as np
# Sample data for two groups
women_weight = np.array([38.9, 61.2, 73.3, 21.8, 63.4, 64.6,
48.4, 48.8, 48.5])
men_weight = np.array([67.8, 60, 63.4, 76, 89.4, 73.3, 67.3,
61.3, 62.4])
# Perform the two-sample t-test
t_statistic, p_value = stats.ttest_ind(women_weight, men_weight)
print("T-statistic:", t_statistic)
print("P-value:", p_value)

# Sample data (paired observations)
before = [200.1, 190.9, 192.7, 213, 241.4, 196.9, 172.2,185.5,
205.2, 193.7]
after = [392.9, 393.2, 345.1, 393, 434, 427.9, 422, 383.9,392.3,
352.2]
# Perform the paired t-test
t_statistic, p_value = stats.ttest_rel(before, after)
# Print the results
print("T-statistic:", t_statistic)
print("{:.10f}".format(p_value))
# Check for significance (e.g., alpha = 0.05)
alpha = 0.05
if p_value < alpha:
    print("The difference between the means is statistically significant.")
else:
    print("There is no statistically significant difference between the means.")

from scipy.stats import chisquare
observed_values = np.array([22,30,23])
# Expected frequencies
expected_values = np.array([25, 25, 25])
# Perform the Chi-square goodness-of-fit test
chi_square_statistic, p_value = chisquare(observed_values,f_exp=expected_values)
# Set significance level (alpha)
alpha = 0.05
# Check if the p-value is less than alpha
if p_value < alpha:
    print("Reject the null hypothesis: The observed data does not fit the expected distribution.")
else:
    print("Fail to reject the null hypothesis: The observed data fits the expected distribution.")
# Output the results
print("Chi-square statistic:", chi_square_statistic)
print("P-value:", p_value)

from scipy.stats import chi2_contingency
# Observed data in a contingency table
observed_values = np.array([[50, 75],
[125,175],[90,30],[45,10]])
# Chi-square test
chi2, p_value, degrees_of_freedom, expected_values = chi2_contingency(observed_values)
print("Chi-square statistic:", chi2)
print("P-value:", p_value)
print("Degrees of freedom:", degrees_of_freedom)
print("Expected values:\n", expected_values)
# Interpretation
alpha = 0.05
if p_value < alpha:
    print("Reject the null hypothesis: There is a significant association between the variables.")
else:
    print("Fail to reject the null hypothesis: There is no significant association between the variables.")