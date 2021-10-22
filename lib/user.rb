require 'pg'
require './lib/venue'
require 'bcrypt'

class User
  attr_reader :user_id, :email , :mobile_number

  def initialize(user_id:, email:, mobile_number:)
    @user_id = user_id
    @email = email
    @mobile_number = mobile_number
  end

  @user_id = session[:user_id]

  def new_venue(name:, description:, price_per_night:, date:) #only hosts do this
    host_user_id = @user_id
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("INSERT INTO venues (host_user_id, name, description, price_per_night, date) VALUES('#{host_user_id}', '#{name}', '#{description}', '#{price_per_night}, '#{date}') RETURNING host_user_id, name, description, price_per_night, date;")
    Venue.create(user_id: result[0]['host_user_id'], name: result[0]['name'], description: result[0]['description'], price_per_night: result[0]['price_per_night'], date: result[0]['date'])
  end  

  def self.create(email:, password:, mobile_number:) #both hosts and guests do this
    encrypted_password = BCrypt::Password.create(password)
    connection = PG.connect(dbname: 'makersbnb')
    result = DatabaseConnection.query("INSERT INTO users (email, password, mobile_number) VALUES('#{email}', '#{encrypted_password}', '#{mobile_number}') RETURNING user_id, email, mobile_number;")
    User.new(user_id: result[0]['user_id'], email: result[0]['email'], mobile_number: result[0]['mobile_number'])
  end

  def requested_bookings #only hosts do this
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("SELECT * FROM venues, bookings WHERE host_user_id = '#{@user_id}' AND venues.venue_id::INTEGER = bookings.venue_id::INTEGER AND confirmed::INTEGER = 0;")
    # above sql selects only those venues that are in the bookings table but are not confirmed
    result.map do |venue|
      Venue.new(venue_id: result[0]['venue_id'], user_id: result[0]['user_id'], name: result[0]['name'], description: result[0]['description'], price_per_night: result[0]['price_per_night'], date: result[0]['date'])
    end
  end

  def self.confirm_booking(venue_id) #only hosts do this
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("UPDATE bookings SET confirmed = '1' WHERE venue_id = '#{venue_id}';")
    # above sql changes confirmed column for booking from not confirmed to confirmed
  end

end
