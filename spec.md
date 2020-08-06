# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app(Implemented the use of sinatra::base in controllers)
- [x] Use ActiveRecord for storing information in a database(migration of tables through rake and tools supplied by Active Record)
- [x] Include more than one model class (e.g. User, Post, Category)(There are two models users and bucketlistgoals)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)(users has many goals)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)(bucketlist belongs to user)
- [x] Include user accounts with unique login attribute (username or email)(created helper method to auth/as users are created database applies id and foreign key is added to goals table)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying(followed restful routes convention)
- [x] Ensure that users can't modify content created by other users(safe guard with helper methods)
- [x] Include user input validations(cannot sign in without required fields)
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
