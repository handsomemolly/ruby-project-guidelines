require 'active_record'
require_relative 'config/environment'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require_relative 'app/models/make_request'
require_relative 'app/models/controller'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
