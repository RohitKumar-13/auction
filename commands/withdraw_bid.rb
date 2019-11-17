require_relative '../repositories/buyer_repository'
require_relative '../repositories/auction_repository'

module Command
  module WithdrawBid
    def self.executable?(type)
      type.eql?('WITHDRAW_BID')
    end

    def self.execute(*args)
      buyer = BuyerRepository.get(args[0])
      auction = AuctionRepository.get(args[1])

      auction.withdraw(buyer)
    end
  end
end
