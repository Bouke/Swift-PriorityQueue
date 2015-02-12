# Swift-PriorityQueue

```swift
import PriorityQueue

var queue = PriorityQueue<Double, String>()
queue.push(3, item: "C")
queue.push(2, item: "B")
queue.push(1, item: "A")

for p in queue {
    println(" * \(p)")
}
```

Prints:

     * A
     * B
     * C

## Alternatives

* CFBinaryHeap (once CFunctionPointer becomes available)
* Swift-DataStructures/MinPQ

## Note to self

Rebuild this playground with the following command:

    rm -rf README.playground/
    playground README.md --platform ios
