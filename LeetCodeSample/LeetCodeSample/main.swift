//
//  main.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

example(title: "LinkedList merge two list") {
    
    let left = LinkedList<Int>()
    let right = LinkedList<Int>()
    left.appends(1,2,4,4,6,7,8)
    right.appends(1,3,4,4,5,6,71)
    
    func mergeNodes<T: Comparable>(lhs: LinkedNode<T>?, rhs: LinkedNode<T>?) -> LinkedNode<T>? {
        guard let lhs = lhs else {
            return rhs
        }
        guard let rhs = rhs else {
            return lhs
        }
        if lhs.val < rhs.val {
            let temp = mergeNodes(lhs: lhs.next, rhs: rhs)
            lhs.next = temp
            temp?.previous = lhs
            return lhs
        }
        let temp = mergeNodes(lhs: lhs, rhs: rhs.next)
        rhs.next = temp
        temp?.previous = rhs
        return rhs
        
    }
    
    func merge(lhs: LinkedList<Int>, rhs: LinkedList<Int>) -> LinkedList<Int> {
        guard let lnode = lhs.head else { return rhs }
        guard let rnode = rhs.head else { return lhs }
        if lnode.val < rnode.val {
            lnode.next = mergeNodes(lhs: lnode.next, rhs: rnode)
            return lhs
        }
        rnode.next = mergeNodes(lhs: lnode, rhs: rnode.next)
        return rhs
    }
    
    let list = merge(lhs: left, rhs: right)

    print(list.debugDescription)
}
