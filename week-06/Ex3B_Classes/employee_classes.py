class Employee:
    """Represents an employee with name, department, and salary."""
    
    def __init__(self, name, department, salary):
        self.name = name
        self.department = department
        self.salary = salary
    
    def describe_employee(self):
        print(f"Employee: {self.name}")
        print(f"Department: {self.department}")
        print(f"Salary: ${self.salary:,.2f}")
        print("-" * 30)
    
    def give_raise(self, amount):
        self.salary += amount
        print(f"{self.name} received a raise of ${amount:,.2f}.")

# Create instances
emp1 = Employee("Rebecca Yang", "HR", 69000)
emp2 = Employee("Kahna Larsen", "IT", 112000)

emp1.describe_employee()
emp2.describe_employee()

emp1.give_raise(5000)
emp1.describe_employee()
