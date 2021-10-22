require './lib/user'

describe User do
  it 'initialises with user_id' do
    u = User.new(user_id: "67", email: "g@gmail.com", mobile_number: "+441234567891")
    expect(u.user_id).to eq "67"
  end
  it 'initialises with email' do
    u = User.new(user_id: "67", email: "g@gmail.com", mobile_number: "+441234567891")
    expect(u.email).to eq "g@gmail.com"
  end

  it 'initialises with mobile number' do
    u = User.new(user_id: "67", email: "g@gmail.com", mobile_number: "+441234567891")
    expect(u.mobile_number).to eq "+441234567891"
  end

  context '#new_venue' do
    it 'requests a new venue is created' do
      u = User.new(user_id: "67", email: "g@gmail.com", mobile_number: "+4412345678")
      expect(u).to respond_to(:new_venue)
    end
  end
end

