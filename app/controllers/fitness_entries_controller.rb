class FitnessEntriesController < ApplicationController

  # get fitness_entries/new to render a form to create new entry 
  get '/fitness_entries/new' do
    erb :'/fitness_entries/new'
  end
  # post fitness_entries to create a new fitness entry
  post '/fitness_entries' do
  end
  # show route for a fitness entry

  #index route for all fitness entries
end