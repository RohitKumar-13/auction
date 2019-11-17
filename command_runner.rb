require_relative 'commands/create_buyer'
require_relative 'commands/create_seller'
require_relative 'commands/create_auction'
require_relative 'commands/create_bid'
require_relative 'commands/withdraw_bid'
require_relative 'commands/close_auction'
require_relative 'commands/get_profit'


module CommandRunner
  def self.run(command_str)
    args = command_str.split(' ')
    command = args.shift
    klass = commands.find {|c| c.executable?(command) }
    klass.execute(*args) if klass
  end

  def self.commands
    [
       Command::CreateBuyer,
       Command::CreateSeller,
       Command::CreateAuction,
       Command::CreateBid,
       Command::WithdrawBid,
       Command::CloseAuction,
       Command::GetProfit
    ]
  end
end