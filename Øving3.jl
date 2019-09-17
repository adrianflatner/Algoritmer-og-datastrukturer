function bisect_right(A, p, r, v)
    i = p
    if p < r
        q = floor(Int, (p+r)/2)
       if v + 1 <= A[q]
            i = bisect_right(A, p, q, v)
       else
           i = bisect_right(A, q+1, r, v)
       end
    end
    return i
end



function bisect_right(A, p, r, v)
    i = p
    if p < r
        q = floor(Int, (p+r)/2)
       if v + 1 <= A[q]
            i = bisect_right(A, p, q, v)
       else
           i = bisect_right(A, q+1, r, v)
       end
    end
    return i
end
