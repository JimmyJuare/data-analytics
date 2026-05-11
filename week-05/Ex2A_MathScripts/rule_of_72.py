savings = 2500
interest_rate = 0.08
years = 72 / (interest_rate * 100)
doubled = savings * 2

print(f"Your current savings is {savings}.")
print(f"At a {format(interest_rate, '.0%')} interest rate, your savings account will be")
print(f"worth {format(doubled, '.2f')} in {format(years, '.1f')} years")
