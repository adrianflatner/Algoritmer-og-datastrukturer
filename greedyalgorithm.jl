function can_use_greedy(coins)
    for i = 1:length(coins)-1
        con = coins[i] % (coins[i+1])
        if con != 0
            return false
        end
    end
    return true
end

coins = [6,2,1]

println(can_use_greedy(coins))
#=
function min_coins_greedy(coins, value)
    sum = 0
    for element in coins
        if (value -= element) >= 0
            count += 1
            min_coins_greedy(coins, (value-element))
        end
    end
    return count
end

println(min_coins_greedy(coins, 20))
=#

function min_coins_greedy(coins, value)
    count = 0
    val = value
    for element in coins
        count += fld(val, element)
        val = val % element
    end
    return count
end

println(min_coins_greedy(coins, 100))
