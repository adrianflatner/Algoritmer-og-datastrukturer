function parse_string(sentence::String)::Array{Tuple{String,Int}}
    A = split(sentence)
    j = 1
    B = [(A[j],1)]
    for i = 1:length(sentence)
        if sentence[i] == ' '
            x = i+1
            j += 1
            push!(B, (A[j], x))
        end
    end
    return B
end

#println(parse_string("wn ti ut"))
module nodemodule
struct Node
    children::Dict{Char,Node}
    posi::Array{Int}
end
end

Node() = nodemodule.Node(Dict(),[])

function build(list_of_words)
    root = Node()
    node = root
    for x in list_of_words
        node = root
        for letter in x[1]
            if !haskey(node.children, letter)
                node.children[letter] = Node()
                node = get(node.children, letter, nothing)
            else
                node = get(node.children, letter, nothing)
            end
        end
        push!(node.posi, x[2])
    end
    return root
end

println(build([("en",1),("hei",4),("et",7)]))
#=
dict = Dict("a" => 1, "b" => 2)
bla = [(2, 3), (1,4)]

for x in bla
    println(x[1])
end


s = "heihei"
println(replace(s, s[1] => ""))
println(s)
=#
