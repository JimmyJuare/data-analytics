import random
import math
import statistics

vals_1_100 = range(1, 100)
vals_sample = random.sample(vals_1_100, 75)
vals_choices = random.choices(vals_1_100, k=200)
radius = random.randint(3, 10)
pi = math.pi

print("_Experimenting with a subset of integers 1-100:")
print("Sum of 75 sample values from 1 to 100:", sum(vals_sample))
print("Average of 75 sample values:", round(statistics.mean(vals_sample), 2))
print("Median of 75 sample values:", statistics.median(vals_sample))

print("\n_Experimenting with a superset of 200 values, integers 1-100:")
print("Average of 200 values:", round(statistics.mean(vals_choices), 2))
print("Median of 200 values:", statistics.median(vals_choices))
print("Mode of 200 values:", statistics.mode(vals_choices))
print("Standard deviation of 200 values:", round(statistics.stdev(vals_choices), 2))
print("Variance of 200 values:", round(statistics.variance(vals_choices), 2))

print("\n_Modeling a random circle:")
area_up = math.ceil(pi * radius ** 2)
area_down = math.floor(pi * radius ** 2)
print(f"Radius = {radius}, area = {area_up} (rounded up)")
print(f"Radius = {radius}, area = {area_down} (rounded down)")
