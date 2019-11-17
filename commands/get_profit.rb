require_relative '../repositories/seller_repository'
require 'byebug'

module Command
  module GetProfit
    def self.executable?(type)
      type.eql?('GET_PROFIT')
    end

    def self.execute(*args)
      seller = SellerRepository.get(args[0])
      p seller.profit
    end
  end
end
