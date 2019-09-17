adjacency_matrix = [0 7 2; Inf 0 Inf; Inf 4 0]

function floyd_warshall(adjacency_matrix, nodes, f, g)
    d = adjacency_matrix
    for k = 1:nodes
        for i = 1:nodes
            for j = 1:nodes
                d[i,j]=f(d[i,j],g(d[i,k],d[k,j]))
            end
        end
    end
    return d
end

#floyd_warshall(adjacency_matrix,3,min,+)


function and(num,num2)
    if num == 1 && num2 == 1
        return 1
    else return 0
    end
end

function or(num,num2)
    if num == 1 || num2 == 1
        return 1
    else return 0
    end
end

function transitive_closure(adjacency_matrix, nodes)
    t = adjacency_matrix
    for i = 1:nodes
        for j = 1:nodes
            if i == j || t[i,j] != Inf
                t[i,j] = 1
            else
                t[i,j] = 0
            end
        end
    end
    return floyd_warshall(t, nodes,or,and)
end

function value(letter)
    return letter - 'A' + 1
end

function create_preference_matrix(ballots, voters, candidates)
    matrix = zeros(candidates,candidates)
    l = candidates

    for k = 1:voters
        for i = 1:len
            row = value(ballots[k][i])
            for j = i+1:len
                collumn = value(ballots[k][j])
                matrix[row,collumn] += 1
            end
        end
    end
    return matrix
end

println(create_preference_matrix(["ABC", "BCA", "ABC"], 4, 3))
