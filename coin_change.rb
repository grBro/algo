def exchange(clist, change, min_coins, coins_used)
  0.upto(change) do |cents|
    coin_counter = cents
    new_coin = 1
    clist.select { |c| c <= cents }.each do |j|
      if 1 + min_coins[cents-j] < coin_counter
        coin_counter = 1 + min_coins[cents-j]
        new_coin = j
      end
    end

    min_coins[cents] = coin_counter
    coins_used[cents] = new_coin
  end

  min_coins[change]
end

def print_coins(coins_used, change)
  coin = change
  while coin > 0 do
    this_coin = coins_used[coin]
    puts this_coin
    coin = coin - this_coin
  end
end


amnt = 13
clist = [1, 5, 10]
coins_used = Array.new(amnt) { 0 }
coins_count = Array.new(amnt) { 0 }

exchange(clist, amnt, coins_count, coins_used)
print_coins(coins_used, amnt)
