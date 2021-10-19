class User
  attr_reader :user_id, :email
  def initialize(user_id:, email:)
    @user_id = user_id
    @email = email
  end

  
end
