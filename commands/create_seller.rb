require_relative '../models/seller'
require_relative '../repositories/seller_repository'

module Command
  module CreateSeller
    def self.executable?(type)
      type.eql?('ADD_SELLER')
    end

    def self.execute(*args)
      seller = Seller.create(*args)
      SellerRepository.add(seller)
    end
  end
end
