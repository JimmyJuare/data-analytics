people = 38
vans = (people + 14) // 15
total_cost = vans * 250
per_person = total_cost / people

print(f"Vans needed: {vans}")
print(f"Total cost: ${total_cost}")
print(f"Cost per person: ${per_person:.2f}")
