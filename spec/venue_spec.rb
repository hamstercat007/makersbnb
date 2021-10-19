require './lib/venue'

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
  context '#all' do
    it 'returns all venues' do
      v = Venue.create(user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000", date: "1st May 2021")
      v = Venue.create(user_id: "3444", name: "Bungalow", description: "Tiny 1 bed", price_per_night: "500", date: "2nd May 2021")
      expect(Venue.all).to include "Penthouse 5"
      expect(Venue.all).to include "Bungalow"
    end
  end
end