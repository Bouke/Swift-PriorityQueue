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
characters.push("C")
characters.push("B")
characters.push("A")

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
nodes.push(Node(priority: 4))
nodes.push(Node(priority: 5))
nodes.push(Node(priority: 3))
nodes.push(Node(priority: 1))

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

## Removing items

```swift
var ints = PriorityQueue<Int>(<)
ints.push(3)
ints.remove(3)  // Returns 3
ints.remove(3)  // Returns nil
```

## Inspecting the heap

```swift
ints.push(5)
ints.push(4)
ints.heap  // Returns [4, 5]
```

# Alternatives

* [CFBinaryHeap](https://developer.apple.com/reference/corefoundation/cfbinaryheap-s11) (once CFunctionPointer becomes available)
* [Swift-DataStructures/MinPQ](https://github.com/ikaver/Swift-DataStructures)
* [davecom/SwiftPriorityQueue](https://github.com/davecom/SwiftPriorityQueue)

# Development
## Playground

Rebuild this playground with the following command:

    rm -rf README.playground/
    playground README.md --platform ios

## Credits

This library was written by [Bouke Haarsma](https://twitter.com/BoukeHaarsma).
