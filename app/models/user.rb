class User < ActveRecord::Base
    has_secure_password
    #allows us to use an activerecrd MACRO 
    #(gives us access to few new method) called 'authinticate'
    #which takes a paaword as a plain string and checks it against 
    #Bcrypt hashing algorythm to make sure that it's the correct password. 

    has_many :fitness_entries 

end 