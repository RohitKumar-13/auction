class BuyerRepository
  @@buyers = {}

  class << self
    def buyers
      @@buyers
    end

    def get(name)
      self.buyers[name]
    end

    def add(buyer)
      self.buyers[buyer.name] = buyer
    end
  end
end