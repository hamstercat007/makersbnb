require './lib/venue'

describe Venue do
  it 'initialises with host_user_id' do
    v = Venue.new("5144", "Penthouse 5", "Riverside 4 bed", "1000")
    expect(v.host_user_id).to eq "5144"
  end
  it 'initialises with name' do
    v = Venue.new("5144", "Penthouse 5", "Riverside 4 bed", "1000")
    expect(v.name).to eq "Penthouse 5"
  end
  it 'initialises description' do
    v = Venue.new("5144", "Penthouse 5", "Riverside 4 bed", "1000")
    expect(v.description).to eq "Riverside 4 bed"
  end
  it 'initialises with price_per_night' do
    v = Venue.new("5144", "Penthouse 5", "Riverside 4 bed", "1000")
    expect(v.price_per_night).to eq "1000"
  end
  it 'initialises with price_per_night' do
    v = Venue.new("5144", "Penthouse 5", "Riverside 4 bed", "1000", )
    expect(v.price_per_night).to eq "1000"
  
  end
end