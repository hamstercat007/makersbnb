require 'venue'

describe Venue do

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

  
  
  describe '.all' do
    it 'returns a list of venues' do
  
      venue = Venue.create(user_id: "Penthouse 5", name: "Riverside 4 bed", description: "Beautiful villa", price_per_night: '1000.00' , date: "12th May 2021")
      venues = Venue.all
      expect(venues.first.description).to eq "Beautiful villa"
      expect(venues.first.date).to eq "12th May 2021"
      expect(venues.first.user_id).to eq "Penthouse 5"
      expect(venues.first.name).to eq "Riverside 4 bed"
      expect(venues.first.price_per_night).to eq '1000.00'
    end
  end 

end
