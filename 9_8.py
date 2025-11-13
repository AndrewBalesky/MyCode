import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import binom
n = 6  # Number of trials
p = 0.2  # Probability of success
customers = [0,1,2,3,4,5,6]
for x in customers:
    prob = binom.pmf(x, n, p)
    prob = f'{prob:.9f}'
    print(x, prob)
# Generate x-values (number of successes)
x = np.arange(0, n + 1)
# Calculate binomial probabilities
pmf = binom.pmf(x, n, p)
# Create the line plot
plt.plot(x, pmf, marker='')
plt.xlabel('Number of Successes')
plt.ylabel('Probability')
plt.title('Binomial Distribution (n={}, p={})'.format(n, p))
plt.show()

import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import binom
n = 6  # number of trials
p = 0.2  # probability of success
k = 5   # number of successes
# Calculate the cumulative probability of getting up to k successes
cumulative_probability = binom.cdf(k, n, p)
print(cumulative_probability)
# Generate x values
x = np.arange(0, n+1)
# Calculate CDF values
cdf = binom.cdf(x, n, p)
# Create plot
plt.plot(x, cdf, marker='')
plt.xlabel('Number of Successes')
plt.ylabel('Cumulative Probability')
plt.title('Binomial CDF (n={}, p={})'.format(n, p))
plt.grid(False)
plt.show()