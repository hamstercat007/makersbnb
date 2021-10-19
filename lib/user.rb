require 'pg'
require './lib/venue'

class User
  attr_reader :user_id, :email 
  def initialize(user_id:, email:)
    @user_id = user_id
    @email = email
  end

  def new_venue(user_id:, name:, description:, price_per_night:, date:)
    host_user_id = user_id
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("INSERT INTO venues (host_user_id, name, description, price_per_night, date) VALUES('#{host_user_id}', '#{name}', '#{description}', '#{price_per_night}, '#{date}') RETURNING host_user_id, name, description, price_per_night, date;")
    Venue.create(user_id: result[0]['host_user_id'], name: result[0]['name'], description: result[0]['description'], price_per_night: result[0]['price_per_night'], date: result[0]['date'])
  end  

  def self.create(email:, password:)
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING user_id, email;")
    User.new(user_id: result[0]['user_id'], email: result[0]['email'])
  end

end