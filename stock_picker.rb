print "Input stock prices separated with a comma: "
# input numbers, split it in an array and convert every element to integer
prices = gets.chomp.split(",").map(&:to_i)

def stock_picker(arr)
  best_day = Array.new
  iteration = 0
  profit = 0
  # Shorten an array with every iteration so sell day is always in front
  for i in (iteration+1)..arr.length
    arr[(iteration+1)..arr.length].each  { |e|
      if e - arr[iteration] > profit
        best_day[1] = arr.index(e)
        best_day[0] = iteration
        profit = e - arr[iteration]
      end
    }
    iteration += 1
  end
  begin
    puts "[#{best_day[0]},#{best_day[1]}] # for a profit of $#{arr[best_day[1]]} - $#{arr[best_day[0]]} == $#{profit}"
  rescue
    puts "No profit"
  end
end

stock_picker(prices)
