require 'sinatra/base'
require 'sinatra/reloader'
require './lib/venue'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end 

  # first page
  get '/' do
    erb:index
  end

  # first page - collects login details of user and redirects to the venues page.
  post '/user/login' do
    #validation and login
    # useless assignment to variables at the moment. 
    # user_is and password need to be integrated into a session.
    user_id = params[:user_id]
    password = params[:password]
    redirect '/venues'
  end

  # first page - 'sign up' button returns the 'user/signup' form.
  get '/user/signup' do
    erb:user_signup
  end

  # /user/signup page - collects new user login details and redirects back to the first page.
  post '/user/add' do
    new_user_id = params[:user_id]
    new_user_password = params[:password]
    # TBC - add new_user_id and new_user_password to the users database.
    redirect '/'
  end

  # /venues page - shows all the available venues to book
  get '/venues' do
    @venues = Venue.all
    erb:venues_2
  end
  
  # /venues/new page - collects new venue details and redirects back to the venues page.
  get '/venues/new' do
    erb:'venues_new'
  end

  post '/venues/add' do
    #Venue.create(user_id: params[:user_id], name: params[:venue_name], description: params[:description], price_per_night: params[:price_per_night], date: params[:date])
    # TBC - add new venue details to the venues database.
    redirect '/venues'
  end

  run! if app_file == $0
end
