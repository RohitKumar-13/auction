class Winner
  attr_accessor :auction, :buyer, :amount

  def initialize(auction, buyer, amount)
    @auction = auction
    @buyer = buyer
    @amount = amount
  end
end