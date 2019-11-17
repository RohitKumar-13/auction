require_relative '../models/buyer'
require_relative '../repositories/buyer_repository'

module Command
  module CreateBuyer
    def self.executable?(type)
      type.eql?('ADD_BUYER')
    end

    def self.execute(*args)
      buyer = Buyer.create(*args)
      BuyerRepository.add(buyer)
    end
  end
end
