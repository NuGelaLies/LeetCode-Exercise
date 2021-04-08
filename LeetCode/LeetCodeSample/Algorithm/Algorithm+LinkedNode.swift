//
//  Algorithm+LinkedNode.swift
//  LeetCodeSample
//
//  Created by NuGelaliee on 3/24/21.
//

import Foundation

extension Algorithm {
    
    func reverseList(_ head: LinkedNode<Int>?, _ left: Int, _ right: Int) -> LinkedNode<Int>? {

        func helper(_ node: LinkedNode<Int>?, _ count: Int) -> LinkedNode<Int>? {
            if count == 1 {
                return node
            }
            let temp = node?.next?.next
            let last = helper(node?.next, count - 1)
            node?.next?.next = node
            node?.next = temp
            return last
        }

        if left == 1 {
            return helper(head, left)
        }

        return reverseList(head?.next, left - 1, right - 1)
    }
    
    // leetCode 239
//    func windowMax(_ nums: [Int], _ windowCount: Int) -> [Int] {
//        guard nums.count > 0, nums.count >= windowCount else {
//            return []
//        }
//
//
//
//    }

    func reverse(_ node: LinkedNode<Int>?) -> LinkedNode<Int>? {
        if node?.next == nil {return node}
        node?.next?.next = node
        node?.next = nil
        return reverse(node?.next)
    }
    
    func reverseN(_ node: LinkedNode<Int>?, _ count: Int) -> LinkedNode<Int>? {
        var temp = node
        
        func helper(_ node: LinkedNode<Int>?, _ count: Int) -> LinkedNode<Int>? {
            if count == 1 {
                temp = node
                return node
            }
            node?.next?.next = node
            node?.next = temp
            return helper(node?.next, count - 1)
        }
        return helper(node, count)
    }
    
    func reverse(node: LinkedNode<Int>?, left: Int, right: Int) -> LinkedNode<Int>? {
        guard node != nil, left <= right else {
            return node
        }
        var temp = node
        for _ in 0..<(left - 1) {
            temp = temp?.next
        }
        
        let res = reverseN(temp?.next, right - left)
        temp?.next = res
        return temp
    }
}
