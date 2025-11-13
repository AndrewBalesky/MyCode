import pandas as pd
import statsmodels.api as sm
from statsmodels.formula.api import ols
from statsmodels.stats.multicomp import pairwise_tukeyhsd
import matplotlib.pyplot as plt

# Step 1: Import the text file
file_path = r"C:\Users\andre\OneDrive\Desktop\School\cropData.txt"  # adjust path
data = pd.read_csv(file_path, sep='\t')  # use sep=',' if comma-separated

# Step 2: Rename 'yield' to avoid keyword conflict
data = data.rename(columns={'yield': 'Yield'})

# Step 3: Fit a one-way ANOVA model on fertilizer
model = ols('Yield ~ C(fertilizer)', data=data).fit()

# Step 4: Generate ANOVA table
anova_table = sm.stats.anova_lm(model, typ=2)
print("One-Way ANOVA on Fertilizer:\n")
print(anova_table)

# Step 5 (Optional): Tukey’s HSD post-hoc test if fertilizer is significant
tukey = pairwise_tukeyhsd(endog=data['Yield'],
                          groups=data['fertilizer'],
                          alpha=0.05)

print("\nTukey HSD Test for Fertilizer:\n")
print(tukey)

# Step 6 (Optional): Plot Tukey results
tukey.plot_simultaneous()
plt.title("Tukey HSD - Fertilizer")
plt.show()


## Two Way ANOVA

# File path


# Load data
data = pd.read_csv(file_path, sep='\t')
data = data.rename(columns={'yield': 'Yield'})  # Avoid Python keyword

# Fit two-way ANOVA with interaction (no blocking)
model = ols('Yield ~ C(fertilizer) * C(density)', data=data).fit()

# Perform two-way ANOVA
anova_table = sm.stats.anova_lm(model, typ=2)  # Type II ANOVA
print(anova_table)

#Two way ANOVA (no interaction)


 # update as needed

# Step 2: Load the data
data = pd.read_csv(file_path, sep='\t')  # use sep=',' if comma-separated

# Step 3: Rename 'yield' column to avoid Python keyword issue
data = data.rename(columns={'yield': 'Yield'})

# Step 4: Fit the two-way ANOVA model without interaction
model = ols('Yield ~ C(fertilizer) + C(density)', data=data).fit()

# Step 5: Perform the ANOVA (each factor appears once)
anova_table = sm.stats.anova_lm(model, typ=2)
print("Two-Way ANOVA Table (No Interaction):\n")
print(anova_table)