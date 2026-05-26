class Restaurant:
    """Represents a restaurant including its name, cuisine type, 
    number of customers served, and customer ratings."""
    
    def __init__(self, rest_name, food_type):
        self.rest_name = rest_name
        self.food_type = food_type
        self.number_served = 0          # Default attribute
        self.customer_ratings = []      # Default empty list
    
    def describe_rest(self):
        """Prints the name of the restaurant and the type of food it serves."""
        print(f"{self.rest_name} serves {self.food_type}.")
    
    def rest_open(self):
        """Prints a message indicating the restaurant is open."""
        print(f"{self.rest_name} is open.")
    
    def add_num_served(self, num):
        """Adds the number of customers served today."""
        self.number_served += num
    
    def print_num_served(self):
        """Prints how many customers the restaurant has served."""
        print(f"{self.rest_name} has served {self.number_served} customers.")
    
    def customer_rating(self, rating):
        """Accepts a rating 1-5 and updates average rating."""
        if isinstance(rating, int) and 1 <= rating <= 5:
            self.customer_ratings.append(rating)
            avg = sum(self.customer_ratings) / len(self.customer_ratings)
            print(f"Your rating was {rating}. The average rating for this restaurant is {avg:.2f}")
        else:
            print("Invalid rating. Please enter an integer between 1 and 5.")


# Create three restaurants
rest1 = Restaurant("Weedy's", "Burgers")
rest2 = Restaurant("Taco Baco", "Mexican")
rest3 = Restaurant("Applebee's", "American")

# Test number served
for rest in [rest1, rest2, rest3]:
    rest.print_num_served()
    rest.add_num_served(45)
    rest.add_num_served(72)
    rest.print_num_served()
    print("-" * 40)

# Test customer ratings
rest1.customer_rating(5)
rest1.customer_rating(4)
rest1.customer_rating(5)
rest1.customer_rating(3)

# Test invalid inputs
rest1.customer_rating(6)
rest1.customer_rating(2.5)
rest1.customer_rating("5 stars!")
