import numpy as np
import matplotlib.pyplot as plt
np.random.seed(123)  # for reproducibility
women_weight = np.array([38.9, 61.2, 73.3, 21.8, 63.4, 64.6,
48.4, 48.8, 48.5])
men_weight = np.array([67.8, 60, 63.4, 76, 89.4, 73.3, 67.3,
61.3, 62.4])
n_boot = 10000
diff_means = np.empty(n_boot)
for i in range(n_boot):
    sample_women = np.random.choice(women_weight,
size=len(women_weight), replace=True)
    sample_men = np.random.choice(men_weight,
size=len(men_weight), replace=True)
    diff_means[i] = np.mean(sample_men) - np.mean(sample_women)
ci = np.percentile(diff_means, [2.5, 97.5])
obs_diff = np.mean(men_weight) - np.mean(women_weight)
print(f"95% bootstrap CI: {ci}")
print(f"Observed difference in means: {obs_diff}")
# Histogram of bootstrap differences
plt.hist(diff_means, bins=30, color='skyblue',
edgecolor='white')
plt.axvline(obs_diff, color='red', linewidth=2, label='Observed Difference')
plt.axvline(ci[0], color='green', linestyle='--', linewidth=2,
label='95% CI')
plt.axvline(ci[1], color='green', linestyle='--', linewidth=2)
plt.title('Bootstrap Distribution of Difference in Means')
plt.xlabel('Mean(Men) - Mean(Women)')
plt.ylabel('Frequency')
plt.legend()
plt.show()

import numpy as np
from sklearn.utils import resample
np.random.seed(123)  # for reproducibility
women_weight = np.array([38.9, 61.2, 73.3, 21.8, 63.4, 64.6,
48.4, 48.8, 48.5])
men_weight = np.array([67.8, 60, 63.4, 76, 89.4, 73.3, 67.3,
61.3, 62.4])
data = {
    'weight': np.concatenate([women_weight, men_weight]),
    'group': np.array(['Women']*len(women_weight) +
    ['Men']*len(men_weight))
}
def boot_diff(data_weight, data_group, n_boot=10000):
    boot_stats = []
    n = len(data_weight)
    for _ in range(n_boot):
        indices = np.random.choice(n, n, replace=True)
        sample_weights = data_weight[indices]
        sample_groups = data_group[indices]
        mean_men = np.mean(sample_weights[sample_groups == 'Men'])
        mean_women = np.mean(sample_weights[sample_groups == 'Women'])
        boot_stats.append(mean_men - mean_women)
    return np.array(boot_stats)
bootstrap_diffs = boot_diff(data['weight'], data['group'],
n_boot=10000)
# Calculate confidence intervals
# Normal Approximation CI
mean_diff = np.mean(bootstrap_diffs)
std_diff = np.std(bootstrap_diffs)
ci_norm = (mean_diff - 1.96*std_diff, mean_diff + 1.96*std_diff)
# Percentile CI
ci_perc = (np.percentile(bootstrap_diffs, 2.5),
np.percentile(bootstrap_diffs, 97.5))
print(f"Normal Approximation CI: {ci_norm}")
print(f"Percentile CI: {ci_perc}")