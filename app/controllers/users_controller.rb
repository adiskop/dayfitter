class UsersController < ApplicationController

    # what routes do I need for login? 
    # the purpose of this route is to show(render) login page(form)
    get '/login' do
        erb :login
    end 

    # what routes do i need for signup?
    get '/signup' do

    end



end