//
//  LRULinkedList.swift
//  LeetCodeSample
//
//  Created by NuGelaliee on 3/16/21.
//

import Foundation

class LRULinkedNode {
    let key: Int
    var val: Int
    
    var prev: LRULinkedNode?
    var next: LRULinkedNode?
    
    init(key: Int, val: Int) {
        self.key = key
        self.val = val
    }
}

class LRULinkedList {
    
    
    var head: LRULinkedNode = .init(key: 0, val: 0)
    
    var tail: LRULinkedNode = .init(key: 0, val: 0)
    
    var dict: [Int: LRULinkedNode] = [:]
    
    var count = 0
    
    private let capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.prepare()
    }
    
    private func prepare() {
        head.next = tail
        tail.prev = head
    }
    
    private func insert(_ node: LRULinkedNode) {
        dict[node.key] = node
        head.next?.prev = node
        node.next = head.next
        head.next = node
        node.prev = head
        
        count += 1
    }
    
    private func remove(_ key: Int) {
        guard count > 0, let node = dict[key] else {
            return
        }
        dict[key] = nil
        
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.prev = nil
        node.next = nil
        
        count -= 1
    }
    
    func put(key: Int, value: Int) {
        if let node = dict[key] {
            node.val = value
            remove(key)
            insert(node)
            return
        }
        let node = LRULinkedNode(key: key, val: value)
        dict[key] = node
        if count == capacity, let tailKey = tail.prev?.key {
            remove(tailKey)
        }
        insert(node)
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            remove(key)
            insert(node)
            return node.val
        }
        return -1
    }
}
