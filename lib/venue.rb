require 'pg'

class Venue
  attr_reader :venue_id, :user_id, :name, :description, :price_per_night, :date
  def initialize(venue_id:, user_id:, name:, description:, price_per_night:, date:)
    @venue_id = venue_id
    @user_id = user_id
    @name = name
    @description = description
    @price_per_night = price_per_night
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM venues EXCEPT SELECT venues.venue_id, venues.host_user_id, venues.name, venues.description, venues.price_per_night, venues.date FROM venues, bookings WHERE venues.venue_id::INTEGER = bookings.venue_id::INTEGER AND bookings.confirmed::INTEGER = 1;")
    # above sql selects all venues, but removes those venues that are in the bookings table and are confirmed 
    result.map do |venue|
      Venue.new(venue_id: venue['venue_id'], user_id: venue['host_user_id'], name: venue['name'], description: venue['description'],  price_per_night: venue['price_per_night'], date: venue['date'])
    end
  end

  def self.create(user_id:, name:, description:, price_per_night:, date:)
    host_user_id = user_id
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("INSERT INTO venues (host_user_id, name, description, price_per_night, date) VALUES('#{host_user_id}', '#{name}', '#{description}', '#{price_per_night}', '#{date}') RETURNING venue_id, host_user_id, name, description, price_per_night, date;")
    Venue.new(venue_id: result[0]['venue_id'], user_id: result[0]['user_id'], name: result[0]['name'], description: result[0]['description'], price_per_night: result[0]['price_per_night'], date: result[0]['date'])
    
  end
end
