require_relative 'user'

class Buyer < User
  def self.create(name)
    User.create(:buyer, name)
  end
end