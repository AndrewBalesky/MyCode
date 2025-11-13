import numpy as np
np.random.seed(42)
Side_effect = np.random.binomial(100,.05,1000)
print(Side_effect[:15])
print(np.round(np.mean(Side_effect),decimals=3))
print(np.round(np.var(Side_effect),decimals=3))

np.random.seed(42)
#Simulate predictor variable
x = np.random.normal(loc=0, scale=1, size=100)
#Simulate the error term
e = np.random.normal(loc=0, scale=2, size=100)
#Compute the outcome via the model.
y = 0.6 + 1.5 * x + e
print(y[:6])
print("Minimum:", np.round(np.min(y),decimals=4))
print("1st Qu:", np.round(np.percentile(y,25),decimals=4))
print("Median:", np.round(np.median(y),decimals=4))
print("Mean:", np.round(np.mean(y),decimals=4))
print("3rd Qu:", np.round(np.percentile(y,75),decimals=4))
print("Maximum:", np.round(np.max(y),decimals=4))