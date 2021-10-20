require 'pg'

class Booking 
  def self.create(user_id:, venue_id:) #only guests do this
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("INSERT INTO bookings (guest_user_id, venue_id, confirmed) VALUES('#{user_id}', '#{venue_id}', '0');")
  end
end
