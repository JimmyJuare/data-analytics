bill = float(input("What is the restaurant bill amount? $"))
tip_percent = float(input("What tip percentage do you want to give? (e.g. 0.20 for 20%) "))

tip_amount = bill * tip_percent

print(f"The tip on a ${bill} restaurant bill is ${tip_amount:.2f}")

# Pitfalls:
# input() returns string so must use float()
# crashes if user enters letters
