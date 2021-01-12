# here is where I will create some seed data to work with and test associations
 
# Create 2 users:

howard = User.create(name: 'Howard', email: 'howard@howard.com', password:'password')
sherry = User.create(name: 'Sherry', email: 'sherry@sherry.com', password:'password')

# Create some fitness entries

FitnessEntry.create(excersize_list: "Push Ups - 30 /n Pull Ups - 10", user_id: howard.id)

# Use Active Record to pre-associate data: (using activerecord methods)

howard.fitness_entries.create(excersize_list: "Squats - 20")

sherrys_entry = sherry.fitness_entries.build(excersize_list: "run - 10 minutes")
sherrys_entry.save

# 'build' method institiates an object that comes already with a foreign key
# 'build' is similar to 'new' in that it doesn't commit to the database, 
# which is why we have to 'save'