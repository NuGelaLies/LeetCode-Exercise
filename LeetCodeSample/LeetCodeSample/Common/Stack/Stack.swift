//
//  Stack.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

class Stack<Element> {
    var array: [Element] = []
    
    init() {}
    
    public func push(_ value: Element) {
        array.append(value)
    }
    
    public func pop() -> Element? {
        return array.popLast()
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
}
