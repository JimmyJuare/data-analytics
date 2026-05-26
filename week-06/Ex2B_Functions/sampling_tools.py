import random

products = ['Laptop', 'Monitor', 'Keyboard', 'Mouse', 'Webcam',
            'Headset', 'Docking Station', 'USB Hub', 'Desk Lamp', 'Surge Protector']

print("=== Product of the Day ===")
print("Product of the Day:", random.choice(products))

print("\n=== Usability Survey (3 products) ===")
survey = random.sample(products, 3)
print("Selected for survey:", survey)

print("\n=== Shuffled Product List ===")
random.shuffle(products)          
print("Shuffled products:", products)

print("\n=== Simulated Daily Transactions ===")
transactions = random.randint(50, 300)
print("Daily transaction count:", transactions)
