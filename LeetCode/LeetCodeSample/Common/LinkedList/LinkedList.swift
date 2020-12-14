//
//  LinkedList.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

class LinkedList<T: Comparable> {
    
    typealias Node = LinkedNode<T>
    
    var head: Node?
    
    var last: Node? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public var count: Int {
        var count = 1
        guard var node = head else {
            return 0
        }
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public func node(at target: Int) -> Node {
        guard var node = head else {
            fatalError("empty linkedlist")
        }
        guard target >= 0, target < count else {
            fatalError("out of linkedlist range")
        }
        guard target != 0 else {
            return head!
        }
        for _ in 1...target {
            node = node.next!
        }
        return node
    }
    
    public subscript(_ index: Int) -> T {
        return node(at: index).val
    }
    
    public func append(_ value: T) {
        let node = Node(value)
        append(node)
    }
    
    public func append(_ node: Node) {
        node.next = nil
        if let next = last {
            next.next = node
            node.previous = next
        } else {
            head = node
        }
    }
    
    public func insert(_ value: T, at target: Int) {
        insert(Node(value), at: target)
    }
    
    public func insert(_ value: Node, at target: Int) {
        guard let node = head else {
            head = value
            return
        }
        if target == 0 {
            node.previous = value
            value.next = node
            head = value
        } else {
            let prev = self.node(at: target - 1)
            let current = self.node(at: target)
            prev.next = value
            value.next = current
            current.previous = value
            value.previous = prev
        }
    }
    
    public func remove(_ target: Int) -> T {
        return remove(node(at: target))
    }
    
    public func remove(_ node: Node) -> T {
        let prev = node.previous
        let next = node.next
        if let previous = prev {
            previous.next = next
        } else {
            head = next
        }
        next?.previous = prev
        node.previous = nil
        node.next = nil
        return node.val
    }
}

extension LinkedList: CustomDebugStringConvertible {
    var debugDescription: String {
        guard !isEmpty else {
            return "this linkedlist isEmpty"
        }
        var list = "[ \(head!.val)"
        for i in 1..<count {
            list += " -> \(self.node(at: i).val)"
        }
        list += " ]"
        return list
    }
}
