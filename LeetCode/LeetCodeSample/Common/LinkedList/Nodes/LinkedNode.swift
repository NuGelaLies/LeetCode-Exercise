//
//  LinkedNode.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

class LinkedNode<T: Comparable> {

    let val: T
    
    var next: LinkedNode?
    
    weak var previous: LinkedNode?
    
    init(_ val: T) {
        self.val = val
    }
}

extension LinkedNode: Comparable {
    
    static func < (lhs: LinkedNode<T>, rhs: LinkedNode<T>) -> Bool {
        return lhs.val < rhs.val && lhs.previous === rhs.previous && lhs.next === rhs.next
    }
    
    static func == (lhs: LinkedNode<T>, rhs: LinkedNode<T>) -> Bool {
        return lhs.val == rhs.val && lhs.previous === rhs.previous && lhs.next === rhs.next
    }
    
    
}
