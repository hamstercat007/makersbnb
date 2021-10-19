require 'pg'

class Venue
  #will need to add a date argument, column in db, etc
  attr_reader :user_id, :name, :description, :price_per_night
  def initialize(user_id:, name:, description:, price_per_night:)
    @user_id = user_id
    @name = name
    @description = description
    @price_per_night = price_per_night
  end

  def self.all
    connection = PG.connect(dbname: 'makersbnb')
    result = connection.exec("SELECT * FROM venues;")
    result.map { |venue| venue['name'] }
  end
end
