require_relative 'user'
require_relative '../repositories/seller_repository'

class Seller < User
  attr_accessor :auctions, :user
  def initialize(name)
    @auctions = []
    @user = User.create(:seller, name)
  end

  def self.create(name)
    seller = new(name)
    SellerRepository.add(seller)
  end

  def add_auction(auction)
    auctions.push(auction)
  end

  def profit
    auctions.map(&:profit).sum
  end
end