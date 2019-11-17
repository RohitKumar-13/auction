class AuctionRepository
  @@auctions = {}

  class << self
    def auctions
      @@auctions
    end

    def get(id)
      self.auctions[id]
    end

    def add(auction)
      self.auctions[auction.id] = auction
    end
  end
end