require_relative '../repositories/buyer_repository'
require_relative '../repositories/auction_repository'

module Command
  module CreateBid
    def self.executable?(type)
      type.eql?('CREATE_BID')
    end

    def self.execute(*args)
      buyer = BuyerRepository.get(args[0])
      auction = AuctionRepository.get(args[1])
      amount = args[2]

      auction.bid(buyer, amount.to_f.round(2))
    end
  end
end
