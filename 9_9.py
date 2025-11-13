import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
np.random.seed(25) #set seed
n = 5  # number of trials
p = 0.3  # probability of success
size = 1000000  # number of simulations
# Generate random samples from the binomial distribution
samples = np.random.binomial(n, p, size)
print(samples[:1000])

df=pd.DataFrame(samples)
summary=df.describe()
print(summary)
plt.hist(samples, bins=6)
plt.xlabel('samples')
plt.ylabel('Frequency')
plt.title('Histogram of samples')
plt.show()

np.random.seed(25)
# Set the rate parameter (lambda) of the Poisson process
lambda_rate = 0.61
# Set the number of events to generate
num_events = 1000000
# Generate random numbers from a Poisson distribution
horse_kick_death = np.random.poisson(lambda_rate, num_events)
# Print the events
print(horse_kick_death)
print(np.mean(horse_kick_death))
print(round(np.var(horse_kick_death), 2))

from scipy.stats import poisson
num_deaths =range(0,10)
for x in num_deaths:
    #Calculate the PMF for x, given lambda = 2
    pmf = poisson.pmf(x, mu=0.61)
    pmf = f'{pmf:.3f}'
    print(pmf)
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import poisson
# Set the parameters of the Poisson distribution
mu = 0.61
# Generate x values
x = np.arange(0, 10)
# Calculate the PMF
pmf = poisson.pmf(x, mu)
print(pmf)
# Plot the PMF
plt.plot(x, pmf)
plt.xlabel('Number of Deaths')
plt.ylabel('Probability')
plt.title('Poisson PMF (mu = {})'.format(mu))
plt.show()

from scipy.stats import poisson
mu = 0.61
x = 5
cdf = poisson.cdf(x, mu)
print(cdf)
More_than_5 = 1-cdf
More_than_5 =f'{More_than_5:.15f}'
print(More_than_5)
from scipy.stats import poisson
num_deaths =range(0,11)
for x in num_deaths:
    #Calculate the PMF for x, given lambda = 2
    cdf = poisson.cdf(x, mu=0.61)
    cdf = f'{cdf:.15f}'
    print(cdf)
mu = 0.61
# Generate x values
x = range(0, 11)
# Calculate the PMF
cdf = poisson.cdf(x, mu)
print(cdf)
# Plot the CDF
plt.plot(x, cdf)
plt.xlabel('Number of Deaths')
plt.ylabel('Probability')
plt.title('Poisson CDF (mu = {})'.format(mu))
plt.show()