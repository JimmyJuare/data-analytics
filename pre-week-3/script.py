import pandas as pd
import random

courses = [
    'Intro to Python',
    'Web Development Basics',
    'Data Science Foundations',
    'JavaScript Essentials',
    'Database Design',
    'Cybersecurity Fundamentals',
    'Machine Learning Intro',
    'Cloud Computing Basics',
    'Mobile App Development',
    'UI/UX Design Principles',
    'DevOps Fundamentals',
    'Artificial Intelligence Overview',
]

data = []

for course in courses:
    enrollment = random.randint(50, 500)
    rating = round(random.uniform(3.0, 5.0), 1)
    
    data.append({
        "Course Name": course,
        "Enrollment Count": enrollment,
        'Average Rating' :rating
    })

df = pd.DataFrame(data)

# print(df)

# print('-------------------------------------------------------------------------')

# print('these are the columns', df.columns, '\n')

# print('this is the column of course names: \n')

# print(df['Course Name'])
    
# print('this is a single row in the series: ', df['Course Name'][0])

df.to_excel("homework1_exercise1A.xlsx", index=False)
