import numpy as np
np.random.seed(42)
#Simulate predictor variables
x1 = np.random.normal(loc=2, scale=1, size=100)
x2 = np.random.normal(loc=0, scale=2, size=100)
#Simulate the error term
e = np.random.normal(loc=0, scale=np.sqrt(3), size=100)
#Compute the outcome via the model.
y = -4.10 + 10.09*x1 +0.09*x2+ e
print(y[:6])
print("Minimum:", np.round(np.min(y),decimals=4))
print("1st Qu:", np.round(np.percentile(y,25),decimals=4))
print("Median:", np.round(np.median(y),decimals=4))
print("Mean:", np.round(np.mean(y),decimals=4))
print("3rd Qu:", np.round(np.percentile(y,75),decimals=4))
print("Maximum:", np.round(np.max(y),decimals=4))

import numpy as np
from scipy.stats import truncnorm
from scipy import stats as st
np.random.seed(42)
# Define the parameters
lower_bound = 4
upper_bound = 17
mean = 9
std_dev = 3
# Calculate the a and b parameters for truncnorm
a = (lower_bound - mean) / std_dev
b = (upper_bound - mean) / std_dev
# Generate random samples
ages = np.round(truncnorm.rvs(a, b, loc=mean, scale=std_dev, size=50))
print(ages)
print("Minimum:", np.round(np.min(ages),decimals=1))
print("1st Qu:", np.round(np.percentile(ages,25),decimals=1))
print("Median:", np.round(np.median(ages),decimals=1))
print("Mean:", np.round(np.mean(ages),decimals=1))
print("3rd Qu:", np.round(np.percentile(ages,75),decimals=1))
print("Maximum:", np.round(np.max(ages),decimals=1))
print(st.mode(ages))

import numpy as np
from scipy.stats import truncnorm
from scipy import stats as st
np.random.seed(42)
# Define the parameters
lower_bound = 4
upper_bound = 17
mean = 9
std_dev = 3
# Calculate the a and b parameters for truncnorm
a = (lower_bound - mean) / std_dev
b = (upper_bound - mean) / std_dev
# Generate random samples
ages = np.round(truncnorm.rvs(a, b, loc=mean, scale=std_dev, size=50))
import numpy as np
import matplotlib.pyplot as plt
# Create the boxplot
plt.boxplot(ages)
plt.title("Boxplot of Ages")
plt.xlabel("Group")
plt.ylabel("Age")
plt.show()