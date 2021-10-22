require 'sinatra/base'
require 'sinatra/reloader'
require './lib/venue'
require './database_connection_setup'
require './lib/user'
require './lib/booking'
require 'sinatra/flash'

class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end 

  # first page
  get '/' do
    erb:index
  end

  # first page - collects login details of user and redirects to the venues page.
  post '/user/login' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.user_id
      redirect('/venues')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/')
    end
  end

  # first page - 'sign up' button returns the 'user/signup' form.
  get '/user/signup' do
    erb:'user/signup'
  end

  # /user/signup page - collects new user login details and redirects back to the first page.
  post '/user/add' do
    user = User.create(email: params[:email], password: params[:password])
    #store the user's id in a session with a key :user_id. This is a hash. Only the id, only data we need to reload the user from db when we need it.
    session[:user_id] = user.user_id
    redirect '/venues'
  end

  # /venues page - shows all the available venues to book
  get '/venues' do
    #Need to reload the user from the database, because it can't be seen. Store the least data possible - security
    @user = User.find(id: session[:user_id])
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
    Venue.create(user_id: session[:user_id], name: params[:venue_name], description: params[:description], price_per_night: params[:price_per_night], date: params[:date])
    #@user_id = session[:user_id]
    # updated attempt as the user class now has the new_venue method
    #User.new_venue(name: params[:venue_name], description: params[:description], price_per_night: params[:price_per_night], date: params[:date])
    # I think the issue here is that the User.new_venue requires @user_id to be carried out (please see the user.rb file).
    # In order to get @user_id I think we need to get the session[user_id] from when the user logs in.

    redirect '/venues'
  end
  
  # venues/list/request page - shows a flash notice to the guest user when a venue booking is requested
  post '/venues/list/request' do
      Booking.create(user_id: session[:user_id], venue_id: params[:venue_id])
    redirect '/venues'
  end

  # user/id page - shows a list of the requested booking to the host user
  get '/user/id' do
    @user = User.find(id: session[:user_id])
    @requested_bookings = @user.requested_bookings
    erb:'/user/id'
  end

  post '/user/id/confirm' do
    User.confirm_booking(params[:venue_id])
    redirect 'venues'
  end


  get '/user/id/back' do
    redirect 'venues'
  end

  run! if app_file == $0
end
