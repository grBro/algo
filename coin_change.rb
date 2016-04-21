
def exchange(clist, change, min_coins, coins_used, available_coins)
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
  coin = change
  this_coin = []
  while coin > 0 do
    this_coin << coins_used[coin]
    coin = coin - this_coin.last
  end

  p this_coin
end

def print_coins(coins_used, change)
  coin = change
  while coin > 0 do
    this_coin = coins_used[coin]
    puts this_coin
    coin = coin - this_coin
  end
end


amnt = 189
clist = [1, 2, 5, 10, 25, 50]
coins_used = Array.new(amnt) { 0 }
coins_count = Array.new(amnt) { 0 }
available_coins = {50 => 3, 25 => 4}

exchange(clist, amnt, coins_count, coins_used, available_coins)
