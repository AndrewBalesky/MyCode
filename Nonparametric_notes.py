from scipy.stats import mannwhitneyu

# Sample data for two groups
group1 = [540,670,1000,960,1200,4650,4200]
group2 = [5000,4200,1300,900,7400,4500,7500]

# Perform the Mann-Whitney U test
statistic, pvalue = mannwhitneyu(group1, group2)

# Print results
print("Mann-Whitney U statistic:", statistic)
print("P-value:", pvalue)

# Interpret the results
alpha = 0.05
if pvalue < alpha:
    print("Reject the null hypothesis: There is a significant difference between the two groups.")
else:
    print("Fail to reject the null hypothesis: There is no significant difference between the two groups.")


import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats
import numpy as np
from itertools import combinations

# Sample data for three groups
ctr1 = [4.17, 5.58, 5.18, 6.11, 4.5, 4.61, 5.17, 4.53, 5.33, 5.14]
trt1 = [4.81, 4.17, 4.41, 3.59, 5.87, 3.83, 6.03, 4.89, 4.32, 4.69]
trt2 = [6.31, 5.12, 5.54, 5.5, 5.37, 5.29, 4.92, 6.15, 5.8, 5.26]

# Create a DataFrame for easier handling
df = pd.DataFrame({
    'Control': ctr1,
    'Treatment 1': trt1,
    'Treatment 2': trt2
})

# Preview first few rows
print("Head of the data:")
print(df.head())

# Summary statistics
print("\nSummary statistics:")
print(df.describe())

# ==============================
# Comparative Box Plots
# ==============================
plt.figure(figsize=(8, 6))
sns.boxplot(data=df)
plt.title('Comparative Box Plot of Groups')
plt.ylabel('Values')
plt.show()

# ==============================
# Kruskal-Wallis Test
# ==============================
H_statistic, p_value = stats.kruskal(ctr1, trt1, trt2)

print("\nKruskal-Wallis Test Results:")
print("H statistic:", H_statistic)
print("P-value:", p_value)

alpha = 0.05
if p_value < alpha:
    print("The null hypothesis is rejected. There is a significant difference between the groups.")
else:
    print("The null hypothesis is not rejected. There is no significant difference between the groups.")


# ==============================
# Pairwise Comparisons (Wilcoxon rank-sum / Mann-Whitney U)
# ==============================
print("\nPairwise comparisons (Wilcoxon rank-sum test with continuity correction):")
groups = df.columns
for g1, g2 in combinations(groups, 2):
    stat, p = stats.ranksums(df[g1], df[g2])  # Wilcoxon rank-sum test
    print(f"{g1} vs {g2}: statistic={stat:.4f}, p-value={p:.4f}")

# ==============================
# Wilcoxon signed-rank test
# ==============================
# Sample data (paired observations)
Y1 = [81,105.4,119.7,109.7,98.3,146.6,142,150.7,191.5,145.7,82.3,77.3,78.4,131.3,89.6,119.8,121.4,124,140.8,124.8,98.9,89,69.1,89.3,104.1,86.9,77.1,78.9,101.8,96]
Y2 = [80.7,82.3,80.4,87.2,84.2,100.4,115.5,112.2,147.7,108.1,103.1,105.1,116.5,139.9,129.6,98.9,61.9,96.2,125.5,75.7,66.4,49.9,96.7,61.9,80.3,67.7,66.7,67.4,91.8,94.1]

# Perform the Wilcoxon signed-rank test
statistic, p_value = stats.wilcoxon(Y1, Y2)

# Print the results
print("Wilcoxon signed-rank test:")
print("Statistic:", statistic)
print("P-value:", p_value)

# Interpret the results
alpha = 0.05  # Significance level
if p_value < alpha:
    print("Reject the null hypothesis: There is a significant difference between the two samples.")
else:
    print("Fail to reject the null hypothesis: There is no significant difference between the two samples.")