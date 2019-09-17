module f

mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end



function findset(x::DisjointSetNode)
    if x != x.p
        x.p = findset(x.p)
    end
    return x.+p
end


function link(x,y)
    if x.rank > y.rank
        y.p = x
    else
        x.p = y
        if x.rank == y.rank
            y.rank = y.rank + 1
        end
    end
end

function union!(x::DisjointSetNode, y::DisjointSetNode)
    link(findset(x),findset(y))
end
end
function hammingdistance(s1::String, s2::String)
    counter = 0
    for i = 1:length(s1)
        if s1[i] != s2[i]
            counter += 1
        end
    end
    return counter
end


s1 = "hei"
s2 = "kei"

println(hammingdistance(s1,s2))
