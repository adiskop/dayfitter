class User < ActiveRecord::Base
    has_secure_password
    #allows us to use an activerecrd MACRO 
    #(gives us access to few new method) called 'authinticate'
    #which takes a paaword as a plain string and checks it against 
    #Bcrypt hashing algorythm to make sure that it's the correct password. 

    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true


    has_many :fitness_entries 

end 