//
//  PriorityQueue.swift
//  Swift-PriorityQueue
//
//  Created by Bouke Haarsma on 12-02-15.
//  Copyright (c) 2015 Bouke Haarsma. All rights reserved.
//

import Foundation

public class PriorityQueue<T> {

    private final var _heap: [T]
    private let compare: (T, T) -> Bool

    public init(_ compare: (T, T) -> Bool) {
        _heap = []
        self.compare = compare
    }

    public var heap: [T] {
        return _heap
    }

    public func push(newElement: T) {
        _heap.append(newElement)

        if _heap.count == 1 {
            return
        }

        var current = _heap.count - 1
        while current > 0 {
            var parent = (current - 1) >> 1
            if compare(_heap[parent], _heap[current]) {
                break
            }
            (_heap[parent], _heap[current]) = (_heap[current], _heap[parent])
            current = parent
        }
    }

    public func pop() -> T? {
        if _heap.count == 0 {
            return nil
        }
        swap(&_heap[0], &_heap[_heap.endIndex - 1])
        let pop = _heap.removeLast()
        _heapify(0)
        return pop
    }

    public func removeAll() {
        _heap.removeAll()
    }

    private func _heapify(index: Int) {
        let left = index * 2 + 1
        let right = index * 2 + 2
        var smallest = index

        let count = _heap.count

        if left < count && compare(_heap[left], _heap[smallest]) {
            smallest = left
        }
        if right < count && compare(_heap[right], _heap[smallest]) {
            smallest = right
        }
        if smallest != index {
            swap(&_heap[index], &_heap[smallest])
            _heapify(smallest)
        }
    }

    public var count: Int {
        return _heap.count
    }

    public var isEmpty: Bool {
        return _heap.isEmpty
    }

    public func remove<T2 where T2: Equatable>(element: T2) -> T? {
        assert(element is T)  // How to enforce this with type constraints?
        for (index, item) in enumerate(_heap) {
            if (item as! T2) == element {
                swap(&_heap[index], &_heap[_heap.endIndex - 1])
                _heap.removeLast()
                _heapify(index)
                return item
            }
        }
        return nil
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
