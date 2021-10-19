describe '.all' do
  it 'returns a list of venue spaces' do
    venues = Venue.all

    expect(venues).to include "http://makers.tech"
    expect(venues).to include "http://www.destroyallsoftware.com"
    expect(venues).to include "http://www.google.com"
  end
end