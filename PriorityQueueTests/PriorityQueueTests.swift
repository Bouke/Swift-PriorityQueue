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
        queue.append(10)
        queue.append(2)
        queue.append(3)
        queue.append(1)
        queue.append(2)
        queue.append(3)
        queue.append(9)
        queue.append(5)

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
            var queue = PriorityQueue<UInt32>(<)
            self.startMeasuring()
            for var i = 0; i < 10000; i += 1 {
                queue.append(arc4random())
            }
            self.stopMeasuring()
        }
    }

    func testPopPerformance() {
        measureMetrics(self.dynamicType.defaultPerformanceMetrics(), automaticallyStartMeasuring:false) {
            var queue = PriorityQueue<UInt32>(<)
            for var i = 0; i < 1000; i += 1 {
                queue.append(arc4random())
            }

            self.startMeasuring()
            for p in queue {}
            self.stopMeasuring()
        }
    }
}
