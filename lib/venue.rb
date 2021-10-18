class Venue
  attr_reader :host_user_id, :name, :description, :price_per_night
  def initialize(host_user_id, name, description, price_per_night)
    @host_user_id = host_user_id
    @name = name
    @description = description
    @price_per_night = price_per_night
  end
end