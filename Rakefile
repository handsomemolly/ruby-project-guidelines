require 'active_record'
require_relative 'config/environment'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require_relative 'app/models/make_request'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  #ActiveRecord::Base.logger = nil

  Pry.start
end
