def stock_picker(s)
  max_profit=0
  buy_day=nil
  sell_day=nil

  # Check the current days price with the prices every day after. Do this for every day.
  s.each_with_index do |buy_price, index|
    # Check prices for every day after the current day.
    (index+1..s.length).each do |i|
      difference=s[i].to_i-buy_price.to_i
      # If the buy and sell days have a bigger difference than the last, save it as the most profitable.
      if max_profit < difference
        max_profit=difference
        buy_day=index+1
        sell_day=i+1
      end
    end
  end
  puts "Stocks prices per day: #{s}"
  puts "Buy on day #{buy_day}"
  puts "Sell on day #{sell_day}"
  puts "Profit #{max_profit}"
end


stock_picker([17,3,6,9,15,8,6,1,10])
