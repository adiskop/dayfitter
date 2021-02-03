#This is the file that allow us to build our project on top of Rack
require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# in order to send PATCH and DELETE requests, I will need to add a line of code here..
use Rack::MethodOverride


#here is where i will mount other controllers with 'use'
use UsersController
use FitnessEntriesController
run ApplicationController

