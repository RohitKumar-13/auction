require_relative 'bid'
require_relative 'winner'
require_relative '../repositories/seller_repository'
require 'set'
require 'byebug'

class Auction
  attr_accessor :id,
                :lowest_bid,
                :highest_bid,
                :participation_cost,
                :seller,
                :bids,
                :closed,
                :participants,
                :winner,
                :amount_wise_bids,
                :withdraws

  def initialize(options)
    @id = options[:id]
    @lowest_bid = options[:lowest_bid]
    @highest_bid = options[:highest_bid]
    @participation_cost = options[:participation_cost]
    @seller = options[:seller]
    @closed = false
    @bids = {}
    @participants = {}
    @winner = nil
    @amount_wise_bids = {}
    @withdraws = {}
  end

  def bid(buyer, amount)
    with_validation do
      bid = Bid.create(buyer, amount)
      if amount.between?(lowest_bid, highest_bid)
        bids[buyer.name] = bid
        if amount_wise_bids[amount]
          amount_wise_bids[amount].push(buyer.name)
        else
          amount_wise_bids[amount] = [buyer.name]
        end
      end
      self.participants[buyer.name] = bid
    end
  end

  def withdraw(buyer)
    with_validation do
      bids.delete(buyer.name)
      withdraws[buyer.name] = true
    end
  end

  def close
    @closed = true
    declare_winner
  end

  def self.create(id, lowest_bid, highest_bid, participation_cost, seller_name)
    seller = SellerRepository.get(seller_name)
    auction = Auction.new({
                     id: id,
                     lowest_bid: lowest_bid.to_f.round(2),
                     highest_bid: highest_bid.to_f.round(2),
                     participation_cost: participation_cost.to_f.round(2),
                     seller: seller
                   }
    )

    seller.add_auction(auction)
    auction
  end

  def declare_winner
    print 'Winner: '
    if participants.count > 0
      uniques = amount_wise_bids.select do |k, v|
        v.count{ |i| !withdraws[i] } == 1
      end
      winning_amount = uniques.keys.sort.last
      buyer = amount_wise_bids[winning_amount].find {|k| !withdraws[k]} if winning_amount
      if buyer
        self.winner = Winner.new(self.id, buyer, winning_amount)
      end
      p winner ? winner : "No Winner"
    else
      puts "No Winner"
    end
  end

  def profit
    winning_auction_price = winner ? winner.amount : 0
    average_price = winner ? (lowest_bid + highest_bid)/2 : 0
    participation_cost_share = participants.count * 0.2

    (winning_auction_price + participation_cost_share - average_price).round(2)
  end

  private

  def with_validation
    raise AuctionClosedError if closed

    yield if block_given?
  end
end