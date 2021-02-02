class FitnessEntriesController < ApplicationController

  # get fitness_entries/new to render a form to create new entry 
  get '/fitness_entries/new' do
    erb :'/fitness_entries/new'
  end

  # post fitness_entries to create a new fitness entry
  post '/fitness_entries' do
    # I want to create a new fitness entry and save it to the database
    # I only want to save the fitness entry if it has a user is logged in
    if !logged_in?
      redirect '/'
    end
    # I only want to save the fitness entry if it has any excersize list
    if params[:excersize_list] !=""
      # create a new fitness entry
      @fitness_entry = FitnessEntry.create(excersize_list: params[:excersize_list], user_id: current_user.id)
      redirect "/fitness_entries/#{@fitness_entry.id}"
    else 
      redirect '/fitness_entries/new'
    end 
  end
  # show route for a fitness entry
  get '/fitness_entries/:id' do
    @fitness_entry = FitnessEntry.find(params[:id])
    erb :'/fitness_entries/show'
  end
  #index route for all fitness entries
end