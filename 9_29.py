import random
import pandas as pd
import numpy as np
from scipy.stats import truncnorm
random_sample = random.sample(range(1, 20292), 100)
print(random_sample)

# Define the parameters
lower_bound = 0
upper_bound = 4
mean = 2.9
std_dev = 2
# Calculate the a and b parameters for truncnorm
a = (lower_bound - mean) / std_dev
b = (upper_bound - mean) / std_dev
# Generate random samples
GPA = np.round(truncnorm.rvs(a, b, loc=mean, scale=std_dev, size=20291),decimals=2)
# Generate numbers from 1 to 20291
num = range(1, 20292)
number=list(num)
#Creating dataframe
data = {"number": number, "GPA": GPA}
#load data into a DataFrame object:
student_list = pd.DataFrame(data)
# Sample n rows randomly
n_sample = 10
df_sample_n = student_list.sample(n = n_sample)
#Printing without row numbers
print(df_sample_n.to_string(index = False))
sample_mean = df_sample_n["GPA"].mean()
print(np.round(sample_mean, decimals=3))
mean_GPA = student_list['GPA'].mean()
print(np.round(mean_GPA, decimals=3))

##9_30
GettysburgData = pd.read_excel(r"C:\Users\andre\OneDrive\Desktop\School\GettysburgData .xlsx")
print(GettysburgData[:6])
sample_word = GettysburgData ['Word'].sample(n=20)
print(sample_word)
np.random.seed(42)
# Sample n rows randomly
n_sample =25
df_sample_n = GettysburgData.sample(n=n_sample)
print(df_sample_n)
counts = df_sample_n['ThreeOrLessLetters'].value_counts()
print(counts.iloc[1]/len(df_sample_n))

##10_2
np.random.seed(42)
# Define the parameters
lower_bound = 0
upper_bound = 4
mean = 2.9
std_dev = 2
# Calculate the a and b parameters for truncnorm
a = (lower_bound - mean) / std_dev
b = (upper_bound - mean) / std_dev
# Generate random samples
GPA = np.round(truncnorm.rvs(a, b, loc=mean, scale=std_dev,
size=20291),decimals=2)
# Generate numbers from 1 to 20291
num = range(1, 20292)
number=list(num)
gender = np.random.binomial(1, 0.5,20291)
#Creating dataframe
data = { "number": number, "GPA": GPA, "gender":gender }
#load data into a DataFrame object:
student_list = pd.DataFrame(data)
# Rename levels in 'category' column
student_list['gender'] = student_list['gender'].replace({1: 'F', 0: 'M'})
print(student_list)
#Creating the strata
#Female stratum
filtered_Female = student_list[student_list['gender'] == 'F']
#Male stratum
filtered_Male = student_list[student_list['gender'] == 'M']
# Sample n rows randomly
n_sample =25
df_sample_female = filtered_Female.sample(n=n_sample)
df_sample_male = filtered_Male.sample(n=n_sample)
df_combined = pd.concat([df_sample_female, df_sample_male])
#Sample mean GPA
mean_GPA = df_combined['GPA'].mean()
print(np.round(mean_GPA, decimals = 3))
