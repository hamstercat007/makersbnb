require 'sinatra/base'
require 'sinatra/reloader'
require './lib/venue'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end 

  get '/' do
    @venues = Venue.all
    erb:index
  end

  run! if app_file == $0
end