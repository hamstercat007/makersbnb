require 'sinatra/base'
require 'sinatra/reloader'
require './lib/venue'
require './database_connection_setup'
require './lib/user'

class Makersbnb < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end 

  # first page
  get '/' do
    erb:index
  end

  # first page - collects login details of user and redirects to the venues page.
  post '/user/login' do
    # TBC - user_id and password need to be integrated into a session.
    session[:email] = params[:email]
    session[:password] = params[:password]
    # Below is an attempt at getting the user_id from the users table by searching the email given at login.
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("SELECT user_id FROM users WHERE email = '#{session[:email]}'")
    session[:user_id] = result
    redirect '/venues'
  end

  # first page - 'sign up' button returns the 'user/signup' form.
  get '/user/signup' do
    erb:'user/signup'
  end

  # /user/signup page - collects new user login details and redirects back to the first page.
  post '/user/add' do
    email = params[:email]
    user_password = params[:password]
    # TBC - pass the new user params into the User.create method to add to the database.
    User.create(email: params[:email], password: params[:password])
    redirect '/'
  end

  # /venues page - shows all the available venues to book
  get '/venues' do
    # @email = session[:email]
    @venues = Venue.all
    erb:'venues/list'
  end

  # /venues/new page - collects new venue details and redirects back to the venues page.
  get '/venues/new' do
    erb:'venues/new'
  end

  post '/venues/add' do
    # TBC - pass the new venue params into the new venue method to add it to the database.

    # original attempt 
    # Venue.create(user_id: params[:user_id], name: params[:venue_name], description: params[:description], price_per_night: params[:price_per_night], date: params[:date])

    # updated attempt as the user class now has the new_venue method
    # User.new_venue(name: params[:venue_name], description: params[:description], price_per_night: params[:price_per_night], date: params[:date])
    # I think the issue here is that the User.new_venue requires @user_id to be carried out (please see the user.rb file).
    # In order to get @user_id I think we need to get the session[user_id] from when the user logs in.

    redirect '/venues'
  end

  run! if app_file == $0
end
