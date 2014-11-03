var queue = PriorityQueue<Double, String>()
queue.push(3, item: "C")
queue.push(2, item: "B")
queue.push(1, item: "A")

for p in queue {
    println(" * \(p)")
}

// Prints:
//  * A
//  * B
//  * C
