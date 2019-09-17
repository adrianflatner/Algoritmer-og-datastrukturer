function algdat_sort!(A)
    p = 1
    r = length(A)
    merge_sort!(A,p,r)
end

function merge_sort!(A,p,r)
    if p<r
        q = floor(Int, (p+r)/2)
        merge_sort!(A,p,q)
        merge_sort!(A,q+1,r)
        mergerino!(A,p,q,r)
    end
end

function mergerino!(A,p,q,r)
    n1 = q-p+1
    n2 = r-q
    L = [1:(n1+1)...]
    R = [1:(n2+1)...]
    for i = 1:n1
        L[i] = A[p+i-1]
    end
    for j = 1:n2
        R[j] = A[q+j]
    end
    L[n1+1] = 999999999
    R[n2+1] = 999999999
    i = 1
    j = 1
    for k = p:r
        if L[i] <= R[j]
            A[k] = L[i]
            i = i + 1
        else
            A[k] = R[j]
            j = j + 1
        end
    end
end

Liste = [8,2,5,2,6,35,36]
Listem = [4,7,8,9,10]

algdat_sort!(Liste)
#mergerino!(Listem,1,3,5)
#println(Listem)

println(Liste)
