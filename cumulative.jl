weights = [3  6  8 6 3;
           7  6  5 7 3;
           4  10 4 1 6;
           10 4  3 1 2;
           6  1  7 3 9]

#Kopier dette inn i kode-vinduet:
function cumulative(weights)
    rows, cols = size(weights)
    result = [0 for i=1:(rows*cols)]
    result = reshape(result, rows, cols)
    for i = 1:rows
        for j = 1:cols
            if i == 1
                result[i,j] = weights[i,j]
            else
                if j == 1
                    x1 = weights[i,j] + result[i-1,j]
                    x2 = weights[i,j] + result[i-1,j+1]
                    result[i,j] = x1 < x2 ? x1 : x2
                elseif j == cols
                    x1 = weights[i,j] + result[i-1,j]
                    x2 = weights[i,j] + result[i-1,j-1]
                    result[i,j] = x1 < x2 ? x1 : x2
                else
                    x1 = weights[i,j] + result[i-1,j]
                    x2 = weights[i,j] + result[i-1,j-1]
                    x3 = weights[i,j] + result[i-1,j+1]
                    r = x1 < x2 ? x1 : x2
                    result[i,j] = r < x3 ? r : x3
                end
            end
        end
    end
    return result
end

println(cumulative(weights))


function back_track(path_weights)
    rows, cols = size(path_weights)
    result = []
    min = Inf
    currentCol = 0
    for i = 1:cols
        if min > path_weights[rows,i]
            min = path_weights[rows,i]
            currentCol = i
        end
    end
    push!(result, (rows, currentCol))
    for i in rows:-1:2
        if currentCol == 1
            x1 = path_weights[i-1,currentCol]
            x2 = path_weights[i-1,currentCol+1]
            currentCol = x1 < x2 ? currentCol : currentCol+1
        elseif currentCol == cols
            x1 = path_weights[i-1,currentCol]
            x2 = path_weights[i-1,currentCol-1]
            currentCol = x1 < x2 ? currentCol : currentCol-1
        else
            x1 = path_weights[i-1,currentCol]
            x2 = path_weights[i-1,currentCol-1]
            x3 = path_weights[i-1,currentCol+1]
            if x2 < x1 < x3 || x2 < x3 < x1
                currentCol -= 1
            elseif x1 < x2 < x3 || x1 < x3 < x2
                currentCol = currentCol
            else
                currentCol += 1
            end
        end
        push!(result, (i-1, currentCol))
    end
    return result
end


println(back_track(cumulative(weights)))

#Litt ekstra tips:



#For å aksessere et element:
#elem = matrix[i,j]
