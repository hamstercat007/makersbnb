require 'venue'

describe Venue do

  describe '.all' do
    it 'returns a list of venues' do

    connection = PG.connect(dbname: 'makersbnb_test')
    # Add the test data
    connection.exec("INSERT INTO venues VALUES(1, 1, 'Penthouse', '4 bed overlooking the Thames', 1000.00);")
    connection.exec("INSERT INTO venues VALUES(2, 2, 'Villa', '3 bed with pool', 500.00);")
    connection.exec("INSERT INTO venues VALUES(3, 3, 'Chalet', '5 bed with fireplace', 750.50);")

    venues = Venue.all

    expect(venues[0].name).to eq "Penthouse"

    end
  end 
  context 'initialize' do
    it 'initialises with host_user_id' do
      v = Venue.new(venue_id: "7", user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000", date: "1st May 2021")
      expect(v.user_id).to eq "5144"
    end
    it 'initialises with name' do
      v = Venue.new(venue_id: "7", user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000", date: "1st May 2021")
      expect(v.name).to eq "Penthouse 5"
    end
    it 'initialises description' do
      v = Venue.new(venue_id: "7", user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000", date: "1st May 2021")
      expect(v.description).to eq "Riverside 4 bed"
    end
    it 'initialises with price_per_night' do
      v = Venue.new(venue_id: "7", user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000", date: "1st May 2021")
      expect(v.price_per_night).to eq "1000"
    end
    it 'initialises with date' do
      v = Venue.new(venue_id: "7", user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000", date: "1st May 2021")
      expect(v.date).to eq "1st May 2021"
    end
    it 'initialises with user_id' do
      v = Venue.new(venue_id: "7", user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000", date: "1st May 2021")
      expect(v.venue_id).to eq "7"
    end
  end

end
