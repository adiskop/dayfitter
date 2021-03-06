class FitnessEntriesController < ApplicationController

    # Index Page:
    get '/fitness_entries' do
      @fitness_entries = FitnessEntry.all
      erb :'fitness_entries/index'
    end

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
    set_fitness_entry
    erb :'/fitness_entries/show'
  end

  # This route should send us to fitness_entries/edit.erb , which will 
  # render an edit form.   
  get '/fitness_entries/:id/edit' do
    set_fitness_entry
    if logged_in?
    if authorized_to_edit?(@fitness_entry)
      erb :'fitness_entries/edit'
    else 
      redirect "users/#{current_user.id}"
    end
  else
    redirect '/'
  end
  end

  # This action's job is to:   
  patch '/fitness_entries/:id' do
    # 1. find the fitness entry (if logged in and if the entry isn't empty!)
    set_fitness_entry
    if logged_in?
      if @fitness_entry.user == current_user && params[:excersize_list] != ""
    # 2. update the fitness entry
    @fitness_entry.update(excersize_list: params[:excersize_list])
    # 3. redirect to show page 
    redirect "/fitness_entries/#{@fitness_entry.id}"
      else 
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end

  delete '/fitness_entries/:id' do
    set_fitness_entry
    if authorized_to_edit?(@fitness_entry)
      # delete the entry 
      @fitness_entry.destroy 
      # go to all entries
      redirect '/fitness_entries'
    else 
      redirect '/fitness_entries' 
    end 
  end
 

  private
  def set_fitness_entry
    @fitness_entry = FitnessEntry.find(params[:id])
  end 

end