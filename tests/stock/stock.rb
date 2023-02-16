# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
# 
#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12
# Quick Tips:
# 
# You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

def stock_picker(prices)
  tot=prices.size
  #puts "num num2 index profit bestprofit days"
  bestprofit=-9999
  days=[]
  prices.each_with_index do |num, index|
    for i in 1 .. tot-1
      if prices[index+i]
        profit=prices[index+i]-num
        if profit > bestprofit
          bestprofit=profit
          days=[index,index+i]
        end
        #puts "#{num} #{prices[index+i]} #{index} #{profit} #{bestprofit} #{days}"
      end
    end
  end
  return days
end

p stock_picker([17,3,6,9,15,8,6,1,10])
