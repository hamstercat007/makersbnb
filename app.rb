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
  
  get '/venues/new' do
    erb :'venues/new'
  end 

  post '/venues' do
    Venue.create(user_id: params[:user_id], name: params[:venue_name], description: params[:description], price_per_night: params[:price_per_night], date: params[:date])
    redirect '/index'
  end 

  run! if app_file == $0
end