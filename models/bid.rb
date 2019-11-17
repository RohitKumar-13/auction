class Bid
  attr_accessor :buyer, :amount

  def initialize(buyer, amount)
    @buyer = buyer
    @amount = amount
  end

  def self.create(buyer, amount)
    new(buyer, amount)
  end
end