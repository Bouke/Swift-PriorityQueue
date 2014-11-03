import Foundation

public class PriorityQueue<PrioType: Comparable, ValueType>: GeneratorType {
    typealias Element = ValueType
    private final var heap = [(PrioType, ValueType)]()

    public init() { }

    public func push(priority: PrioType, item: ValueType) {
        heap.append((priority, item))

        if heap.count == 1 {
            return
        }

        var current = heap.count - 1
        while current > 0 {
            var parent = (current - 1) >> 1
            if heap[parent].0 <= heap[current].0 {
                break
            }
            (heap[parent], heap[current]) = (heap[current], heap[parent])
            current = parent
        }
    }

    public func next() -> ValueType? {
        return pop()?.1
    }

    public func pop() -> (PrioType, ValueType)? {
        if heap.count == 0 {
            return nil
        }
        swap(&heap[0], &heap[heap.endIndex - 1])
        let pop = heap.removeLast()
        heapify(0)
        return pop
    }

    public func removeAll() {
        heap = []
    }

    private func heapify(index: Int) {
        let left = index * 2 + 1
        let right = index * 2 + 2
        var smallest = index

        let count = heap.count

        if left < count && heap[left].0 < heap[smallest].0 {
            smallest = left
        }
        if right < count && heap[right].0 < heap[smallest].0 {
            smallest = right
        }
        if smallest != index {
            swap(&heap[index], &heap[smallest])
            heapify(smallest)
        }
    }

    public var count: Int {
        return heap.count
    }
}

extension PriorityQueue: SequenceType {
    typealias Generator = PriorityQueue
    public func generate() -> Generator {
        return self
    }
}
