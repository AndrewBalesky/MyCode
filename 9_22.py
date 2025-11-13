import numpy as np
from matplotlib import pyplot as plt

np.random.seed(25)
lambda_param = 2
times = np.random.exponential(1 / lambda_param, 1000)
print(times[:10])
mean_time = np.mean(times)
print(f"Mean time between calls (hours): {mean_time:.4f}")
x = np.linspace(0, 3, 300)
pdf = lambda_param * np.exp(-lambda_param * x)
plt.plot(x, pdf, label='Exponential PDF (λ=2)')
plt.xlabel('Time (hours)')
plt.ylabel('Density')
plt.title('Exponential Distribution PDF')
plt.grid(True)
plt.legend()
plt.show()
five_minutes = 5 / 60
prob_within_5min = np.mean(times <= five_minutes)
print(f"Probability that a call comes within 5 minutes:{prob_within_5min:.4f}")

## 9_23
np.random.seed(42)
# Parameters for the binomial distribution
n = 100  # Number of trials
p = 0.5  # Probability of success
sample = np.random.binomial(n, p, size=200)
# Plot the distribution of sample means
plt.hist(sample, bins=30, density=True)
plt.xlabel('Number of Successes')
plt.ylabel('Frequency')
plt.title('Central Limit Theorem for Binomial Distribution')
plt.show()
print(np.mean(sample))
print(np.std(sample))

## 9_25
np.random.seed(123)
# Parameters
n = 10         # Number of trials per sample
p = 0.3        # Probability of success
num_samples = 1000  # Number of samples
# Simulate: each row is one sample of size n
samples = np.random.binomial(n=1, p=p, size=(num_samples, n))
# Compute the sample mean for each sample
# (proportion of successes)
sample_means = samples.mean(axis=1)
# Plot histogram
plt.hist(sample_means, bins=20, color='pink',
edgecolor='black')
plt.title('Sampling Distribution of Sample Means (Binomial)')
plt.xlabel('Sample Mean (Proportion of Successes)')
plt.ylabel('Frequency')
plt.grid(True, linestyle='--', alpha=0.5)
plt.show()

n = 10
p = 0.3
mu = n * p
sigma = np.sqrt(n * p * (1 - p))
# Apply continuity correction: P(X > 4) ≈ P(Y > 4.5)
x_corrected = 4.5
z = (x_corrected - mu) / sigma
# Compute probability
prob = 1 - z
# Print result
print(f"Approximate probability that sample mean > 0.4:{prob:.4f}")

np.random.seed(42)  # for reproducibility
rate = 3  # cuts per hour
scale = 1 / rate  # mean waiting time = 1 / rate, in hours
n_samples = 100
sample_size = 50
# Simulate 100 samples of size 50
sample_means = []
for _ in range(n_samples):
    sample = np.random.exponential(scale=scale, size=sample_size)
sample_means.append(np.mean(sample))
sample_means = np.array(sample_means)
# Plot histogram of sample means
plt.hist(sample_means, bins=15, edgecolor='black', alpha=0.7)
plt.axvline(x=scale, color='red', linestyle='--', linewidth=2, label=f'True Mean = {scale:.3f} hours')
plt.xlabel('Mean Waiting Time (hours)')
plt.ylabel('Frequency')
plt.title('Histogram of Sample Means of Waiting Times')
plt.legend()
plt.show()