require './lib/booking'

describe Booking do

 it 'creates a booking with confirmed value of 0' do
  connection = PG.connect(dbname: 'makersbnb_test')
  result = connection.exec("INSERT INTO bookings (guest_user_id, venue_id, confirmed) VALUES('78', '90', '0') RETURNING confirmed;")
  expect(result[0]['confirmed']).to eq '0'
 end

end