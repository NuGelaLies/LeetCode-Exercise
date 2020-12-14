//
//  Queue.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

class Queue<Element> {
    
    var queues: [Element] = []
    
    public var isEmpty: Bool {
        return queues.isEmpty
    }
    
    public func enqueue(_ queue: Element) {
        queues.append(queue)
    }
    
    public func dequeue() -> Element? {
        return queues.removeFirst()
    }
    
    var front: Element? {
        return queues.first
    }
    
}
