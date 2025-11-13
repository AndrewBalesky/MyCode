import pandas as pd

data = pd.read_excel(r"C:\Users\andre\OneDrive\Desktop\School\airqualityData.xlsx")
print(data[:6])
import matplotlib.pyplot as plt
import numpy as np
data = data['Temp']
plt.hist(data, bins=9)
plt.xlabel('Temperature in degrees Fahrenheit')
plt.ylabel('Density')
plt.title('Maximum daily Temperature at La Guardia Airport')
plt.show()

data = pd.read_excel(r"C:\Users\andre\OneDrive\Desktop\School\airqualityData.xlsx")
x = data['Wind']
y = data['Temp']
# Create the scatter plot
plt.scatter(x, y)
# Add labels and title
plt.xlabel('Wind')
plt.ylabel('Temperature')
plt.title('Wind vs Temperature')
# Display the plot
plt.show()