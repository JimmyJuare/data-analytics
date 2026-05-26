cust_list = []  # Global list to store all customers

class RewardsProgram:
    """Manages customer rewards program information."""
    
    def __init__(self, cust_name, phone, email):
        self.cust_name = cust_name
        self.phone = phone
        self.email = email
    
    def profile(self):
        """Prints customer profile information."""
        print(f"Name: {self.cust_name}")
        print(f"Phone: {self.phone}")
        print(f"Email: {self.email}")
        print("-" * 30)
    
    def thank_you(self):
        """Prints thank you message."""
        print(f"Thank you, {self.cust_name}, for visiting our restaurant!\n")
    
    def add_to_cust_list(self):
        """Adds customer to global customer list."""
        cust_list.append((self.cust_name, self.phone, self.email))

# Create three customers
cust1 = RewardsProgram("Jimmy Smith", "815-555-1234", "jimmy@example.com")
cust2 = RewardsProgram("Sarah Johnson", "312-555-5678", "sarah@example.com")
cust3 = RewardsProgram("Mike Chen", "847-555-9876", "mike@example.com")

# Test methods
cust1.profile()
cust1.thank_you()
cust1.add_to_cust_list()

cust2.profile()
cust2.thank_you()
cust2.add_to_cust_list()

cust3.profile()
cust3.thank_you()
cust3.add_to_cust_list()

# Show all customers added
print("All customers in rewards program:")
for customer in cust_list:
    print(customer)
