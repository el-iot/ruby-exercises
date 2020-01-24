# frozen_string_literal: true

def stock_picker(stocks)
  min_price = nil
  max_profit = 0
  buy_date = nil
  sell_date = nil
  lowest_date = nil

  stocks.each_with_index do |stock, day|
    if min_price.nil? || (stock < min_price)
      min_price = stock
      lowest_date = day
    elsif stock - min_price > max_profit
      sell_date = day
      buy_date = lowest_date
      max_profit = stock - min_price
    end
  end
  [buy_date, sell_date]
end

print stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
