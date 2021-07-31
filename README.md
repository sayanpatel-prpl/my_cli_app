# MY CLI APPLICATION
CLI Applicaton with RBAC System

So the idea is that we have a simple CLI application where the user can enter his/her name and choose roles based on which his/her actions can be determined.
The user can create, view, edit or delete text files. He/She can write anything and can handle it using the tools provided in the app itself.

There are total 4 actions that can be executed here: READ, CREATE, EDIT, DELETE


There are 4 roles:
- Admin: READ, CREATE, EDIT, DELETE
- User: READ
- Pirate: READ, EDIT
- Shark: READ, DELETE

# Functioning

Download the code from the repository. Once done, place it in a folder and run 'bundle install'. This will install the one gem 'tty-prompt' which is being used here.
Once the gems are installed fire the application using 'ruby app.rb'

# Code

The code consists of primarily two files. 'app.rb' and 'actions.rb'. The first file initializes the app after taking in the name of the user. The second file contains every action that is required or defined throughout the flow. 
