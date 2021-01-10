#This is the file that allow us to build our project on top of Rack
require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#in order to send PATCH and DELETE requests
use Rack::MethodOverride

#here is where i will mount other controllers with 'use'

run ApplicationController
