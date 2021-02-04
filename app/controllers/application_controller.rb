require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_first_fitness_app"
  end

  get "/" do
    if logged_in?
    redirect "/users/#{current_user.id}"
    else
      erb :welcome 
    end
  end

  helpers do
    def logged_in?
      # true if user is logged in, otherwise false 
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end 
    
# Does the fitness entry that passed in belongs to the current user
    def authorized_to_edit?(fitness_entry)
      fitness_entry.user == current_user
    end

  end
end
