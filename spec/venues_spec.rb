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

    expect(venues).to include "Penthouse"
    expect(venues).to include "Villa"
    expect(venues).to include "Chalet"
    end
  end 
end
