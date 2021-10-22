require 'bcrypt'
require 'pg'
require './lib/venue'

class User
  attr_reader :user_id, :email 
  def initialize(user_id:, email:)
    @user_id = user_id
    @email = email
  end

  def new_venue(name:, description:, price_per_night:, date:) #only hosts do this
    host_user_id = @user_id
    result = DatabaseConnection.query("INSERT INTO venues (host_user_id, name, description, price_per_night, date) VALUES('#{host_user_id}', '#{name}', '#{description}', '#{price_per_night}, '#{date}') RETURNING host_user_id, name, description, price_per_night, date;")
    Venue.create(user_id: result[0]['host_user_id'], name: result[0]['name'], description: result[0]['description'], price_per_night: result[0]['price_per_night'], date: result[0]['date'])
  end

  def self.create(email:, password:) #both hosts and guests do this
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING user_id, email;")
    User.new(user_id: result[0]['user_id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE user_id = $1", [id]
    )
    User.new(
      user_id: result[0]['user_id'],
      email: result[0]['email'],
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1", [email]
    )
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(user_id: result[0]['user_id'], email: result[0]['email'])
  end

  def requested_bookings #only hosts do this
    connection = PG.connect(dbname: 'makersbnb')
    # the below is combining tables and adding columns, not getting a subset
    result = connection.exec("SELECT * FROM venues, bookings WHERE host_user_id = '#{@user_id}' AND venues.venue_id::INTEGER = bookings.venue_id::INTEGER AND confirmed::INTEGER = 0;")
    result.map do |venue|
      Venue.new(venue_id: result[0]['venue_id'], user_id: result[0]['user_id'], name: result[0]['name'], description: result[0]['description'], price_per_night: result[0]['price_per_night'], date: result[0]['date'])
    end
  end

  def confirm_booking(venue_id) #only hosts do this
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("UPDATE bookings SET confirmed = '1' WHERE venue_id = '#{venue_id}';")
  end

end