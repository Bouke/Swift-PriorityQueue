var characters = PriorityQueue<Character>(<)
characters.append("C")
characters.append("B")
characters.append("A")

println("Characters:")
for p in characters {
    println(" * \(p)")
}
println()