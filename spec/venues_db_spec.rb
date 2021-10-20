require 'venue'

describe Venue do

  describe '.all' do
    it 'returns a list of venues' do
  
      venues = Venue.create(user_id: "Penthouse 5", name: "Riverside 4 bed", description: "Beautiful villa", price_per_night: 1000, date: "12th May 2021")

      expect(venues).to include "Penthouse"
      # expect(venues).to include "Villa"
      # expect(venues).to include "Chalet"
    end
  end 
end