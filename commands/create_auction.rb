require_relative '../models/auction'
require_relative '../repositories/auction_repository'

module Command
  module CreateAuction
    def self.executable?(type)
      type.eql?('CREATE_AUCTION')
    end

    def self.execute(*args)
      auction = Auction.create(*args)
      AuctionRepository.add(auction)
    end
  end
end
