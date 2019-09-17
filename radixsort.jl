function letter_value(string, position)
    return ((Int(string[position]))-96)
end

function counting_sort_letters(A, position)
    U = 26
    B = ["" for i = 1:length(A)]
    C = [1:(U+1)...]

    for i = 1:U+1
        C[i] = 0
    end
    for j = 1:length(A)
        C[letter_value(A[j], position)] = C[letter_value(A[j], position)] + 1
    end
    for i = 2:U+1
        C[i] = C[i] + C[i-1]
    end
    for j = length(A):-1:1
        B[C[letter_value(A[j], position)]] = A[j]
        C[letter_value(A[j], position)] = C[letter_value(A[j], position)] - 1

    end
    return B
end


function counting_sort_length(A)
    U = 256

    B = ["" for i = 1:length(A)]
    C = [1:(U+1)...]

    for i = 1:U
        C[i] = 0
    end
    for j = 1:length(A)
        C[length(A[j])+1] +=  1
    end
    for i = 2:U
        C[i] = C[i] + C[i-1]
    end
    for j = length(A):-1:1
        B[Int(C[length(A[j])+1])] = A[j]
        C[Int(length(A[j])+1)] -= 1

    end
    return B
end


#=function flexradix(A, max_length)
    B = []
    C = []
    for n in A
        if length(n) == max_length
            push!(B, n)
        end
        println(B)
    end
    for i = max_length:-1:1
        B = counting_sort_letters(B, i)
    end
    if max_length != 1
        append!(C,flexradix(B, max_length-1))
    end
        return counting_sort_length(C)
    return B
end
=#

#println(flexradix(["kobra", "aggie", "agg", "kort", "hyblen"], 6))


#=function flexradix2(A, max_length)
    B = []
    C = []
    for n in A
        if length(n) == max_length
            push!(B, n)
            filter!(x->x≠n,A)
        end
    end
    println(B)
    #append!(C,counting_sort_letters(B, max_length))
    append!(C,B)
    #C = counting_sort_letters(B, max_length)

    if max_length != 1
        flexradix2(A, max_length-1)
    end
    # return counting_sort_length(B)
    return C
end
=#
#println(flexradix(["kobra", "aggie", "agg", "kort", "hyblen"], 6))

function flexradix(A, max_length)
    L = String[]
    for i = max_length:-1:1
        l = filter(e -> length(e) == i, A)

        #=
        for e in A
            if length(e) == i
                pushfirst!(l, e)
            end
        end
        =#

        if length(l) != 0
            prepend!(L, l)
        end

        L = counting_sort_letters(L, i)
    end

    prepend!(L, filter(e -> e == "", A))

    return L
end

println(flexradix(["kobra", "aggie", "agg", "kort", "hyblen"], 6))
