class AuctionClosedError < StandardError
  attr_accessor :message

  def initialize
    @message = 'Auction is closed.'
    super(message)
  end
end