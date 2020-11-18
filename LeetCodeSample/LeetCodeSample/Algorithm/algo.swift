//
//  algo.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

struct algo: Algorithm { }

extension algo {
    
    
    //MARK: - add Two Sum
    /**
     
     You are given two non-empty linked lists representing two non-negative integers. The digits are
     stored in reverse order and each of their nodes contain a single digit. Add the two numbers and
     return it as a linked list.
     You may assume the two numbers do not contain any leading zero, except the number 0 itself
     
     Example:
     
     Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
     Output: 7 -> 0 -> 8
     Explanation: 342 + 465 = 807.
     
     */
    
    static func addTwoNum<T>(default value: T, lhs: LinkedNode<T>?, rhs: LinkedNode<T>?) -> LinkedNode<T>? where T : FixedWidthInteger & SignedInteger {
        var carry = value
        if let lnode = lhs {
            carry += lnode.val
        }
        if let rnode = rhs {
            carry += rnode.val
        }
        carry %= 10
        let current = LinkedNode<T>(carry)
        guard lhs == nil, rhs == nil else {
            let node = addTwoNum(default: carry, lhs: lhs?.next, rhs: rhs?.next)
            node?.next = current
            return node
        }
        return current
        
    }
    
//    static func addTwoNum<T>(default value: T, lhs: LinkedList<T>, rhs: LinkedList<T>) -> LinkedList<T>? where T : FixedWidthInteger & SignedInteger {
//        
//        
//    }
    
}
