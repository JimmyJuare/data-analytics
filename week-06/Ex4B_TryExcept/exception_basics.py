print("=== Demonstrating Exception Handling ===\n")

# 1. ValueError
try:
    num = int("not a number")
except ValueError:
    print("ValueError: Cannot convert string to integer")
else:
    print("Success:", num)
finally:
    print("Let's try another one...\n")

# 2. NameError
try:
    print(undefined_variable)
except NameError:
    print("NameError: Variable has not been defined")
finally:
    print("Let's try another one...\n")

# 3. TypeError
try:
    result = "string" + 42
except TypeError:
    print("TypeError: Cannot add string and integer")
finally:
    print("Let's try another one...\n")

# 4. SyntaxError (caught with eval)
try:
    eval("if x == 5 print('hi')")   # Invalid syntax
except SyntaxError:
    print("SyntaxError: Invalid Python syntax")
finally:
    print("Let's try another one...\n")

# Additional common exceptions
try:
    my_list = [1, 2, 3]
    print(my_list[10])              # IndexError
except IndexError:
    print("IndexError: List index out of range")
finally:
    print("End of exception examples.")
