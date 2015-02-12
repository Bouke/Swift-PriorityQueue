struct Node {
    let priority: Int
}

var nodes = PriorityQueue<Node>({ $0.priority < $1.priority })
nodes.push(Node(priority: 4))
nodes.push(Node(priority: 5))
nodes.push(Node(priority: 3))
nodes.push(Node(priority: 1))

println("Nodes:")
for node in nodes {
    println(" * Node(priority: \(node.priority))")
}
println()