//
//  PriorityQueue.swift
//  Swift-PriorityQueue
//
//  Created by Bouke Haarsma on 12-02-15.
//  Copyright (c) 2015 Bouke Haarsma. All rights reserved.
//

import Foundation

public class PriorityQueue<T> {

    private final var heap: [T]
    private let compare: (T, T) -> Bool

    public init(_ compare: (T, T) -> Bool) {
        heap = []
        self.compare = compare
    }

    public func push(newElement: T) {
        heap.append(newElement)

        if heap.count == 1 {
            return
        }

        var current = heap.count - 1
        while current > 0 {
            var parent = (current - 1) >> 1
            if compare(heap[parent], heap[current]) {
                break
            }
            (heap[parent], heap[current]) = (heap[current], heap[parent])
            current = parent
        }
    }

    public func pop() -> T? {
        if heap.count == 0 {
            return nil
        }
        swap(&heap[0], &heap[heap.endIndex - 1])
        let pop = heap.removeLast()
        heapify(0)
        return pop
    }

    public func removeAll() {
        heap.removeAll()
    }

    private func heapify(index: Int) {
        let left = index * 2 + 1
        let right = index * 2 + 2
        var smallest = index

        let count = heap.count

        if left < count && compare(heap[left], heap[smallest]) {
            smallest = left
        }
        if right < count && compare(heap[right], heap[smallest]) {
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

extension PriorityQueue: GeneratorType {
    typealias Element = T
    public func next() -> Element? {
        return pop()
    }
}

extension PriorityQueue: SequenceType {
    typealias Generator = PriorityQueue
    public func generate() -> Generator {
        return self
    }
}
