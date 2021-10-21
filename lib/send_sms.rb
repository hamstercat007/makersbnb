require 'dotenv/load'
require 'twilio-ruby'

class SMS

attr_reader :account_sid, :auth_token, :from, :to, :time

  # to: must be in the form '+447712345678'
  def initialize(to: nil)
    @account_sid = ENV["ACCOUNT_SID"]
    @auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = ENV["TWILIO_MOBILE"] # Your Twilio number
    @to = ENV["MY_MOBILE"] # Your mobile phone number
  end

  #below is sent to host user
  def booking_request
    @client.messages.create(
    from: @from,
    to: @to,
    body: 
    "
    Someone has requested to book one of your venues. Login to see the request!
    "
    )
  end

  #below is sent to guest user
  def request_confirmed
    @client.messages.create(
    from: @from,
    to: @to,
    body: 
    "
    Hooray! The host has accepted your booking request!
    "
    )
  end

  #below is sent to guest user
  def request_denied
    @client.messages.create(
    from: @from,
    to: @to,
    body: 
    "
    We're sorry - the host has declined your booking request.
    "
    )
  end

end