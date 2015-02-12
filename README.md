# Swift-PriorityQueue

When included as a framework, import it as any other framework:

```swift
import PriorityQueue
```

The priority queue is defined as a generic and initialized with a comparison 
callback, like  `PriorityQueue<T>((T, T) -> Bool)`. For example, it can 
operate on characters like this:

```swift
var characters = PriorityQueue<Character>(<)
characters.append("C")
characters.append("B")
characters.append("A")

println("Characters:")
for p in characters {
    println(" * \(p)")
}
println()
```

This would print:

     * A
     * B
     * C

A more real-world use-case would operate on structs or classes, like this:

```swift
struct Node {
    let priority: Int
}

var nodes = PriorityQueue<Node>({ $0.priority < $1.priority })
nodes.append(Node(priority: 4))
nodes.append(Node(priority: 5))
nodes.append(Node(priority: 3))
nodes.append(Node(priority: 1))

println("Nodes:")
for node in nodes {
    println(" * Node(priority: \(node.priority))")
}
println()
```

This would print:

    Nodes:
    * Node(priority: 1)
    * Node(priority: 3)
    * Node(priority: 4)
    * Node(priority: 5)

## Alternatives

* CFBinaryHeap (once CFunctionPointer becomes available)
* Swift-DataStructures/MinPQ

## Note to self

Rebuild this playground with the following command:

    rm -rf README.playground/
    playground README.md --platform ios
