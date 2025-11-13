import numpy as np
data = [4, 5, 7, 9, 1, 8, 10, 17]
mean = np.mean(data)
std_dev = np.std(data)
print("The mean of the dataset is", mean,".")
print("The standard deviation of the dataset is", std_dev,".")
def is_numeric(num):
    try:
        float(num)
        return True
    except ValueError:
        return False
numbers = [1,2.5,3,4.5,5]
for num in numbers:
    print(f"{num} is numeric: {is_numeric(num)}")