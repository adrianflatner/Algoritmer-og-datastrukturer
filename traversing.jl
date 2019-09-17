


module mutableModule

using DataStructures: Queue, enqueue!, dequeue!

mutable struct Node
    id::Int
    neighbours::Array{Node}
    color::Union{String, Nothing}
    distance::Union{Int, Nothing}
    predecessor::Union{Node, Nothing}
end
Node(id) = Node(id, [], nothing, nothing, nothing)



al = [[2,3],[3],[4],[]]

function makenodelist(adjl)
    A = []
    for i = 1:length(adjl)
        n = Node(i)
        push!(A,n)
    end
    for i = 1:length(adjl)
        for element in adjl[i]
            push!(A[i].neighbours, A[element])
        end
    end
    return A
end

nodes = makenodelist(al)

function printnodelist(nodelist)
    println("Skriver ut nodeliste med printnodelist")
    for node in nodelist
        neighbourlist = [neighbours.id for neighbours in node.neighbours]
        println("id: $(node.id), neighbours: $neighbourlist")
    end
end


function main(;n=5, degree=3)
    println("Kjører makenodelist")
    adjacencylist = generateadjacencylist(n, degree)
    @info "adjacencylist" adjacencylist
    nodelist = makenodelist(adjacencylist)
    printnodelist(nodelist)
end


generateadjacencylist(n, degree) = [rand(1:n, degree) for id = 1:n]


# Det kan være nyttig å kjøre mange tester for å se om programmet man har laget
# krasjer for ulike instanser
function runmanytests(;maxlistsize=15)
    # Kjører n tester for hver listestørrelse – én for hver grad
    for n = 1:maxlistsize
        for degree = 1:n
            adjacencylist = generateadjacencylist(n, degree)
            @info "Listelendge $n" n, degree #, adjacencylist
            makenodelist(adjacencylist)
        end
    end
end


main()
#runmanytests()





function bfs!(nodes, start)
    result = nothing
    for node in nodes
        node.color = "white"
        node.distance = 999999
        node.predecessor = nothing
    end
    start.color = "gray"
    start.distance = 0
    start.predecessor = nothing
    Q = Queue{Node}()
    enqueue!(Q,start)
    while !isempty(Q)
        u = dequeue!(Q)
        if isgoalnode(u)
                result = u
            end
        for v in u.neighbours
            if v.color == "white"
                v.color = "gray"
                v.distance = u.distance + 1
                v.predecessor = u
                enqueue!(Q,v)
            end
        end
        u.color = "black"
    end
    return result
end

println(bfs!(nodes, nodes[1]))

end
