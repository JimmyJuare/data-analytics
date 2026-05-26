class Restaurant:
    """Represents a restaurant with name and food type."""
    
    def __init__(self, rest_name, food_type):
        self.rest_name = rest_name
        self.food_type = food_type
    
    def describe_rest(self):
        """Prints the restaurant name and type of food it serves."""
        print(f"{self.rest_name} serves {self.food_type}.")
    
    def rest_open(self):
        """Prints that the restaurant is open."""
        print(f"{self.rest_name} is open.")

# Create three restaurant instances
restaurant1 = Restaurant("Weedy's", "Burgers")
restaurant2 = Restaurant("Taco Bell", "Mexican")
restaurant3 = Restaurant("Applebee's", "American")

# Test the methods
restaurant1.describe_rest()
restaurant1.rest_open()

restaurant2.describe_rest()
restaurant2.rest_open()

restaurant3.describe_rest()
restaurant3.rest_open()
