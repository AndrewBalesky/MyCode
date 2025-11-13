import numpy as np
from scipy.stats import truncnorm
from scipy import stats as st
np.random.seed(42)
lower_bound = 200
upper_bound = 800
mean = 527
std_dev = 112
a = (lower_bound - mean) / std_dev
b = (upper_bound - mean) / std_dev
# Generate random samples
GMATSc = np.round(truncnorm.rvs(a, b, loc=mean,
scale=std_dev, size=10000))
print(GMATSc[:6])
import pandas as pd
GMATSc = pd.DataFrame(GMATSc)
summary = GMATSc.describe()
print(summary)
std_dev = np.std(GMATSc)
print("Standard Deviation:", np.round(np.std(GMATSc)))
import seaborn as sns
import matplotlib.pyplot as plt
sns.kdeplot(GMATSc)
plt.title('Density Plot of GMAT Scores')
plt.xlabel('GMAT Score')
plt.show()

import numpy as np
from scipy.stats import truncnorm
from scipy import stats as st
np.random.seed(42)
# Define the parameters
lower_bound = 200
upper_bound = 800
mean = 527
std_dev = 112
# Calculate the a and b parameters for truncnorm
a = (lower_bound - mean) / std_dev
b = (upper_bound - mean) / std_dev
# Generate random samples
GMATSc = np.round(truncnorm.rvs(a, b, loc=mean, scale=std_dev,
size=10000))
# Finding Mean
m=np.mean(GMATSc)
# Finding Standard Deviation
s=np.std(GMATSc)
#standardized vector
z=(GMATSc -m)/s
print(z[:6])
#Standardize plot
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
sns.kdeplot(z)
plt.title(' Plot of Standardized GMAT Scores')
plt.xlabel('Standardized GMAT Score')
plt.show()