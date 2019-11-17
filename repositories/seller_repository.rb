class SellerRepository
  @@sellers = {}

  class << self
    def sellers
      @@sellers
    end

    def get(name)
      self.sellers[name]
    end

    def add(seller)
      self.sellers[seller.user.name] = seller
    end
  end
end