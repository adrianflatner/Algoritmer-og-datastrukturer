function letter_value(string, position)
    return ((Int(string[position]))-96)
end

function uniqueCh(A, position)
    B = []
    for x in A
        if !(letter_value(x, position) in B)
            push!(B,letter_value(x, position))
        end
    end
    println(length(B))
    return (length(B))
end

function counting_sort_letters(A, position)
    #U = uniqueCh(A, position)
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

#println(counting_sort_letters(["ccc", "cba", "ca", "ab", "abc", "afc"], 2))

function lengthString(A)
    B = []
    for i = 1:length(A)
        push!(B,length(A[i]))
    end
    return (maximum(B))
end


function counting_sort_length(A)
    #U = uniqueCh(A, position)
    #U = lengthString(A)
    U = 256
    println(U)
    B = ["" for i = 1:length(A)]
    #C = [1:(U+1)...]
    C = zeros(U)

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

println(counting_sort_length(["bbbb", "aa", "aaaa", "ccc"]))










function counting_sort_letters(A, position)

    n = length(A)

    # The output character array that will have sorted arr
    output = [1:(n+1)...]

    # Create a count array to store count of inidividul
    # characters and initialize count array as 0
    count = [(1:257)...]
    for i=1:257
        count[i] = 0
    end
    # store count of each character
    for i=1:n+1
        count[A[i]] += 1
    end
    # Change count[i] so that count[i] now contains actual
    # position of this character in output array
    for i=1:256
        count[i] += count[i-1]
    end
    # Build the output character array
    for i = 1:n+1
        output[count[A[i]]-1] = A[i]
        count[A[i]] -= 1
    end

    # Copy the output array to arr, so that arr now
    # contains sorted characters
    for i = 1:n+1
        A[i] = output[i]
    end
end

#counting_sort_letters(['c', 'b', 'a', 'a', 'c'], 2)
