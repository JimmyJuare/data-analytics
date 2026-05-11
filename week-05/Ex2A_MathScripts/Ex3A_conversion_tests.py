# This script tests various numeric conversion techniques

a = " 101.1 "
b = '55'
c = "402 Stevens"
d = 'Number 5 '

a_float = float(a)
a_int = int(float(a))
b_int = int(b)
b_float = float(b)
d_clean = int(d[7:].strip())

print(a, type(a))
print(a_float, type(a_float))
print(a_int, type(a_int))
print(b_int, type(b_int))
print(d_clean, type(d_clean))

print(a.strip())
print(d.strip())
