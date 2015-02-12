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
        var queue = PriorityQueue<Int, Int>()
        queue.push(10, item: 10)
        queue.push(2, item: 2)
        queue.push(3, item: 3)
        queue.push(1, item: 1)
        queue.push(2, item: 2)
        queue.push(3, item: 3)
        queue.push(9, item: 9)
        queue.push(5, item: 5)

        XCTAssertEqual(1, queue.next()!)
        XCTAssertEqual(2, queue.next()!)
        XCTAssertEqual(2, queue.next()!)
        XCTAssertEqual(3, queue.next()!)
        XCTAssertEqual(3, queue.next()!)
        XCTAssertEqual(5, queue.next()!)
        XCTAssertEqual(9, queue.next()!)
        XCTAssertEqual(10, queue.next()!)
        XCTAssertTrue(queue.next() == nil)
    }

    func testPushPerformance() {
        measureMetrics(self.dynamicType.defaultPerformanceMetrics(), automaticallyStartMeasuring:false) {
            var queue = PriorityQueue<UInt32, Int>()
            self.startMeasuring()
            for var i = 0; i < 10000; i += 1 {
                queue.push(arc4random(), item: i)
            }
            self.stopMeasuring()
        }
    }

    func testPopPerformance() {
        measureMetrics(self.dynamicType.defaultPerformanceMetrics(), automaticallyStartMeasuring:false) {
            var queue = PriorityQueue<UInt32, Int>()
            for var i = 0; i < 1000; i += 1 {
                queue.push(arc4random(), item: 1)
            }

            self.startMeasuring()
            for p in queue {}
            self.stopMeasuring()
        }
    }
}
