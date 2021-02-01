class UsersController < ApplicationController

    # what routes do I need for login? 
    # the purpose of this route is to show(render) login page(form)
    get '/login' do
        erb :login
    end 
# the purpose of this route is to receive the login form,
  # find the user, and log the user in (create a session)
  post '/login' do
    # params looks like: {email: "user@user.com", password: "password"}
    # Find the user
    @user = User.find_by(email: params[:email])
    # Authenticate the user - verify the user is who they say they are
    if @user && @user.authenticate(params[:password])
        # log the user in - create the user session
        session[:user_id] = @user.id # actually logging the user in
        # redirect to the user's show page
  
        redirect "/users/{@user.id}"
        else 
        # tell the user they entered invalid credentials 
        # redirect them to the login page
        end
    end

    # what routes do i need for signup?
    # this route's job is to render the sign-up form
    get '/signup' do
        # erb (render) a view
        erb :signup
    end

    #the onlu job this post method has - is to create a user! not to show it to you. This
    
    post '/users' do
        # here we'll create a new user and persist him to the DB
        # params will look like this:
        # {
            # "name"=>"Elizabeth",
            # "email"=>"elizabeth@e.com",
            # "password"=>"password"
        # }
        # I only want to persist a user that has a name, email AND password
        if params[:name] != "" && params[:email] != "" && 
            params[:password] != ""
            # valid input 
            @user = User.create(params)
            # here it will log the user in automatically
            session[:user_id] = @user.id
            # where do i want to go now? -- to user show page possibly 
            redirect "users/#{@user.id}"
        else
            # invalid input
            redirect '/signup'
        end
    end

    # user SHOW route
    # the id is dynamic
    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    get 'logout' do
        session.clear
        redirect '/'
    end

end