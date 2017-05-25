class Quote
  include ActiveModel::Model
  attr_accessor :quote
  attr_accessor :ask
  attr_accessor :bid
  attr_accessor :ask
  attr_accessor :last_trade_date
  attr_accessor :last_trade_time
  attr_accessor :change_in_percent
  attr_accessor :last_trade_price
  attr_accessor :symbol
end
