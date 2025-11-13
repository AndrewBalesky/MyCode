import numpy as np

np.random.seed(42) #set seed
sample = np.random.normal(loc=63.5, scale=2.5, size=2000000)
rounded_sample = np.round(sample, decimals=1)
print(rounded_sample[:6])
Std = np.std(rounded_sample)
STD = np.round(Std, decimals=3)
print("The Standard Deviation is",STD,".")
