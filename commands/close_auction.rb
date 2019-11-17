require_relative '../models/auction'
require_relative '../repositories/auction_repository'

module Command
  module CloseAuction
    def self.executable?(type)
      type.eql?('CLOSE_AUCTION')
    end

    def self.execute(*args)
      auction = AuctionRepository.get(args[0])
      auction.close
    end
  end
end
