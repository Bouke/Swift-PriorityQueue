//
//  Swift_PriorityQueueTests.swift
//  Swift-PriorityQueueTests
//
//  Created by Bouke Haarsma on 12-02-15.
//  Copyright (c) 2015 Bouke Haarsma. All rights reserved.
//

import PriorityQueue
import Foundation
import XCTest


class PriorityQueueTests: XCTestCase {
    func testSimple() {
        var queue = PriorityQueue<Int>(<)
        queue.push(10)
        queue.push(2)
        queue.push(3)
        queue.push(1)
        queue.push(2)
        queue.push(3)
        queue.push(9)
        queue.push(5)

        XCTAssertEqual(1, queue.next()!)
        XCTAssertEqual(2, queue.next()!)
        XCTAssertEqual(2, queue.next()!)
        XCTAssertEqual(3, queue.next()!)
        XCTAssertEqual(3, queue.next()!)
        XCTAssertEqual(5, queue.next()!)
        XCTAssertEqual(9, queue.next()!)
        XCTAssertEqual(10, queue.next()!)
        XCTAssertTrue(queue.next() == nil)

        queue.push(11)
        XCTAssertEqual(11, queue.remove(11) ?? -1)
        XCTAssertNil(queue.remove(11))
    }

    func testRandom() {
        var queue = PriorityQueue<UInt32>(<)
        for var i = 0; i < 10000; i += 1 {
            queue.push(arc4random())
        }
        var current: UInt32 = 0
        for item in queue {
            XCTAssertGreaterThanOrEqual(item, current)
            current = item
        }
    }

    func testUpdate() {
        var queue = PriorityQueue<Item>({ $0.priority < $1.priority })
        let items = [
            Item(priority: 1),
            Item(priority: 2),
            Item(priority: 3),
            Item(priority: 4),
        ]
        items.map { queue.push($0) }
        items[3].priority = 0
        XCTAssertTrue(queue.update(items[3]) == items[3])
        XCTAssertEqual(Array(queue), [items[3], items[0], items[1], items[2]])

        items.map { queue.push($0) }
        items[3].priority = 5
        XCTAssertTrue(queue.update(items[3]) == items[3])
        XCTAssertEqual(Array(queue), [items[0], items[1], items[2], items[3]])
    }

    func testRemove() {
        var queue = PriorityQueue<Int>(<)
        (1...7).map { queue.push($0) }
        XCTAssertTrue(queue.remove(3) == 3)
        XCTAssertEqual(Array(queue), [1,2,4,5,6,7])
    }

    func testPushPerformance() {
        measureMetrics(self.dynamicType.defaultPerformanceMetrics(), automaticallyStartMeasuring:false) {
            var queue = PriorityQueue<UInt32>(<)
            self.startMeasuring()
            for var i = 0; i < 10000; i += 1 {
                queue.push(arc4random())
            }
            self.stopMeasuring()
        }
    }

    func testPopPerformance() {
        measureMetrics(self.dynamicType.defaultPerformanceMetrics(), automaticallyStartMeasuring:false) {
            var queue = PriorityQueue<UInt32>(<)
            for var i = 0; i < 1000; i += 1 {
                queue.push(arc4random())
            }

            self.startMeasuring()
            for p in queue {}
            self.stopMeasuring()
        }
    }
}

private class Item {
    var priority: Int
    init(priority: Int) {
        self.priority = priority
    }
}

extension Item: Equatable {
}

private func == (lhs: Item, rhs: Item) -> Bool {
    return lhs === rhs
}
