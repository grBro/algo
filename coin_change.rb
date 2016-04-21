
def exchange(clist, change, min_coins, coins_used, available_coins, coin_types)
  clist = clist.select { |c| coin_types.include?(c) }
  0.upto(change) do |cents|
    coin_counter = cents
    new_coin = 1
    clist.select { |c| c <= cents }.each do |j|
      if 1 + min_coins[cents-j][j] < coin_counter
        coin_counter = 1 + min_coins[cents-j][j]
        new_coin = j
      end

      min_coins[cents][j] = coin_counter
      coins_used[cents][j] = new_coin
    end
    # min_coins[cents][j] = coin_counter
    # coins_used[cents] = new_coin
  end

  # min_coins[change]
  output(change, min_coins, available_coins, coins_used)
end

def output(change, min_coins, available_coins, coins_used)
  coin = change
  this_coin = []
  while coin > 0 do
    j = min_coins[coin].group_by{|_k, v| v}.min_by{|k, _v| k}.last.to_h.keys[0]

    if available_coins[j] < 1
      available_coins.delete(j)
      min_coins.each {|c| c.delete(j)}

    end

    unless available_coins[j].nil?
      available_coins[j] -= 1

      this_coin << coins_used[coin][j]
      coin = coin - this_coin.last
    end

  end

  p this_coin.group_by { |x| x }.map { |k,v| [k, v.count] }.to_h
end


amnt = 200
clist = [25, 50]
coins_used = Array.new(amnt+1) { Hash[clist.map {|x| [x, 0]}] }
coins_count = Array.new(amnt+1) { Hash[clist.map {|x| [x, 0]}] }
available_coins = {50 => 1, 25 => 4, 10 => 4, 5 => 25, 2 => 18, 1 => 50}
coin_types = [25, 50]

exchange(clist, amnt, coins_count, coins_used, available_coins, coin_types)
