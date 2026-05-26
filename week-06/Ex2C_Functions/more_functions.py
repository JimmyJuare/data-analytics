def display_mailing_label(name, address, city, state, zip_code):
    print(name)
    print(address)
    print(f"{city}, {state} {zip_code}")
    print("-" * 30)

def add_numbers(*numbers):
    total = sum(numbers)
    print(" + ".join(map(str, numbers)), "=", total)

def display_receipt(total_due, amount_paid):
    print(f"Total Due:    ${total_due:.2f}")
    print(f"Amount Paid:  ${amount_paid:.2f}")
    change = amount_paid - total_due
    if change >= 0:
        print(f"Change Due:   ${change:.2f}")
    else:
        print(f"Remaining Balance: ${abs(change):.2f}")

# Test calls
display_mailing_label("Jimmy Smith", "123 Main St", "Bloomington", "IL", "61701")
display_mailing_label("Jane Doe", "456 Oak Ave", "Chicago", "IL", "60601")

add_numbers(5)
add_numbers(10, 20)
add_numbers(1, 2, 3, 4, 5)

display_receipt(85.50, 100.00)
display_receipt(120.00, 120.00)
display_receipt(75.00, 50.00)
