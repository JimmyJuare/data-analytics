import math
length = 12
width = 10
room_area = length * width
boxes_needed = math.ceil(room_area / 12)
boxes_total = math.ceil(boxes_needed * 1.1)
print(f"Boxes needed with 10% extra: {boxes_total}")
