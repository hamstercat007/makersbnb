require 'sinatra/base'
require 'sinatra/reloader'
require './lib/venue'
# require './lib/user'

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
    # session[email] = params[:email]
    # session[password] = params[:password]
    redirect '/venues'
  end

  # first page - 'sign up' button returns the 'user/signup' form.
  get '/user/signup' do
    erb:user_signup
  end

  # /user/signup page - collects new user login details and redirects back to the first page.
  post '/user/add' do
    email = params[:email]
    user_password = params[:password]
    # TBC - pass the new user params into the User.create method to add to the database.
    # User.create(email: params[:email], password: params[:password])
    redirect '/'
  end

  # /venues page - shows all the available venues to book
  get '/venues' do
    # @email = session[:email]
    @venues = Venue.all
    erb:venues_2
  end
  
  # /venues/new page - collects new venue details and redirects back to the venues page.
  get '/venues/new' do
    erb:'venues_new'
  end

  post '/venues/add' do
    # TBC - pass the new venue params into the Venue.create method to add to the database.
    # Venue.create(user_id: params[:user_id], name: params[:venue_name], description: params[:description], price_per_night: params[:price_per_night], date: params[:date])
    redirect '/venues'
  end

  run! if app_file == $0
end
