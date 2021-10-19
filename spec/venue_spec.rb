require './lib/venue'

describe Venue do
  it 'initialises with host_user_id' do
    v = Venue.new(user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000")
    expect(v.user_id).to eq "5144"
  end
  it 'initialises with name' do
    v = Venue.new(user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000")
    expect(v.name).to eq "Penthouse 5"
  end
  it 'initialises description' do
    v = Venue.new(user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000")
    expect(v.description).to eq "Riverside 4 bed"
  end
  it 'initialises with price_per_night' do
    v = Venue.new(user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000")
    expect(v.price_per_night).to eq "1000"
  end
  # it 'initialises with date' do
  #   v = Venue.new(user_id: "5144", name: "Penthouse 5", description: "Riverside 4 bed", price_per_night: "1000")
  #   expect(v.date).to eq "12th May 2021"
  
  # end
end