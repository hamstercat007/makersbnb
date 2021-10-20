require 'sinatra/base'
require 'sinatra/reloader'
require './lib/venue'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end 

  get '/' do
    erb:index
  end

  post '/user/login' do
    # useless assignment to variables at the moment. 
    # user_is and password need to be integrated into a session.
    user_id = params[:user_id]
    password = params[:password]
    erb:venues_2
  end

  post '/user/signup' do
    erb:user_create
  end

  get '/user/create' do
    new_user_id = params[:user_id]
    new_user_password = params[:password]
    # TBC - add new_user_id and new_user_password to the users database.
    erb:index
  end

  



  # get '/venues' do
  #   @venues = Venue.all
  #   erb:venues_2
  # end
  
  # get '/venues/new' do
  #   erb :'venues/new'
  # end 

  # post '/venues' do
  #   Venue.create(user_id: params[:user_id], name: params[:venue_name], description: params[:description], price_per_night: params[:price_per_night], date: params[:date])
  #   redirect '/index'
  # end 

  run! if app_file == $0
end
