using DataStructures: Queue, enqueue!, dequeue!

module s

mutable struct Node
    ip::Int
    neighbours::Array{Tuple{Node,Int}}
    risk::Union{Float64, Nothing}
    predecessor::Union{Node, Nothing}
    probability::Float64
end

function initialize_single_source!(graph, start)
    for node in graph
        node.risk = typemax(Float64)
        node.predecessor = nothing
    end
    start.risk = 0
end

function relax!(from_node,to_node,cost)
    if to_node.risk > from_node + (cost/to_node.probability)
        to_node.risk = from_node + (cost/to_node.probability)
        to_node.predecessor = from_node
    end
end

function extractMin(Q)
    min = Inf
    n = nothing
    for node in Q
        if node.risk < min
            min = node.risk
            n = node
        end
    end
    return n
end

function dijkstra!(graph,start)
    initialize_single_source!(graph, start)
    Q = PriorityQueue{Node, Float64}()
    for node in graph
        enqueue!(Q, node, node.risk)
    end
    while !isempty(Q)
        u = dequeue!(Q)
        for (n, c) in u.neighbours
            priorRisk = n.risk
            relax!(u, n, c)
            if n.risk != priorRisk
                Q[n] = n.risk
            end
        end
    end
end


function bellman_ford!(graph,start)
    initialize_single_source!(graph, start)
    for i = 1:length(graph)-1
        for (n,c) in graph[i].neighbours
            relax!(graph[i],graph[n],c)
        end
    end
    for node in graph
       for (n, c) in node.neighbours
           if n.risk > node.risk + (c / n.probability)
               return false
           end
       end
   end
   return true
end
