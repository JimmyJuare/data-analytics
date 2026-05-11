# Define known values
food_cost = 79.25
tax = 6.54
tip = 12.00
# Calculate the unknown
total_due = food_cost + tax + tip
# Display the results
# print("The total due is " + str(total_due))

'''
a) Remember what the str() function is for? Why is this being used here? Add your
answer as a comment.

its a type casting function that turns an int into a string. its being used here
to turn the given numbers into a printable string that can be concatinated to another sting
as ints cannot be concatinated to strings.
'''

print("Food cost is " + str(food_cost) + " and tax is " + str(tax))
print("Tip is " + format(tip, '.2f'))
print("Total due is " + str(total_due))
