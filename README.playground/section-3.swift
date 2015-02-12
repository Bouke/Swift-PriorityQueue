var characters = PriorityQueue<Character>(<)
characters.push("C")
characters.push("B")
characters.push("A")

println("Characters:")
for p in characters {
    println(" * \(p)")
}
println()