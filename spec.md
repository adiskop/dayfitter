# Specifications for the Sinatra Assessment

Specs:

- [x] Use Sinatra to build the app

  I am using Sinatra to build my app...

- [x] Use ActiveRecord for storing information in a database

yes

- [x] Include more than one model class (e.g. User, Post, Category)

user and fitness entry

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)

user has many fitness entries

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

fitness entry belongs to user

- [x] Include user accounts with unique login attribute (username or email)

email

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

user has full CRUD on fitness entries

- [x] Ensure that users can't modify content created by other users

don't show edit or delete links, also use helper method in controller to ensure edit and delete actions can only happen if current user owns the entry

- [x] Include user input validations

can't create a blank user or fitness entry

- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

now using sinatra-flash to show flash messages

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

finally

Confirm

- [x] You have a large number of small Git commits

 yes

- [x] Your commit messages are meaningful

 yes

- [x] You made the changes in a commit that relate to the commit message

yes

- [x] You don't include changes in a commit that aren't related to the commit message

yes :)