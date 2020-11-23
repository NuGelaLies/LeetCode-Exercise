//
//  Algorithm.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

protocol Algorithm { }

extension Algorithm {
    //MARK: - Two Sum
    /**
     
     Given an array of integers, return indices of the two numbers such that they add up to a specific
     target.
     You may assume that each input would have exactly one solution, and you may not use the same
     element twice.
     
     Example:
     
     Given nums = [2, 7, 11, 15], target = 9,
     Because nums[0] + nums[1] = 2 + 7 = 9,
     return [0, 1]
     */
    static func twoSum(_ target: Int, elements: [Int]) -> [Int] {
        var params = [Int: Int]()
        for (i, item) in elements.enumerated() {
            if let value = params[target - item] {
                return [value, i]
            } else {
                params[item] = i
            }
        }
        return []
    }

    //MARK: - add Two Num
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
        let head = LinkedNode<T>(value)
        var lnode = lhs, rnode = rhs, carry = value, current = head
        while lnode != nil || rnode != nil || carry != 0 {
            if let lnod = lnode {
                carry += lnod.val
                lnode = lnod.next
            }
            if let rnod = rnode {
                carry += rnod.val
                rnode = rnod.next
            }
            let node = LinkedNode<T>(carry % 10)
            carry /= 10
            current.next = node
            node.previous = current 
            current = node
        }
        return head.next
    }
    
    static func addTwoNum<T>(default value: T, lhs: LinkedList<T>, rhs: LinkedList<T>) -> LinkedList<T> where T : FixedWidthInteger & SignedInteger {
        var node = addTwoNum(default: value, lhs: lhs.head, rhs: rhs.head)
        let list = LinkedList<T>()
        while let nod = node {
            node = nod.next
            swap(&nod.previous, &nod.next)
            list.head = nod
        }
        return list
    }
    
    
    //MARK: - Merge Two Sorted Lists
    /**
     Example:
     
     Input: 1->2->4, 1->3
     Output: 1->1->2->3->4
     */
    static func mergeNodes<T: Comparable>(lhs: LinkedNode<T>?, rhs: LinkedNode<T>?) -> LinkedNode<T>? {
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
    
    static func mergeSloted<T: Comparable>(lhs: LinkedList<T>, rhs: LinkedList<T>) -> LinkedList<T> {
        guard let lnode = lhs.head else { return rhs }
        guard let rnode = rhs.head else { return lhs }
        if lnode.val < rnode.val {
            lnode.next = mergeNodes(lhs: lnode.next, rhs: rnode)
            return lhs
        }
        rnode.next = mergeNodes(lhs: lnode, rhs: rnode.next)
        return rhs
    }
    
    //MARK: - Binary Tree Maximum Path Sum
    /**
     Given a non-empty binary tree, find the maximum path sum.
     For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.
     */    
    static func treeMaxSum<T>(_ node: BTreeNode<T>?) -> T where T: FixedWidthInteger & SignedInteger {
        guard let node = node else {
            return 0
        }
        let right = max(0, treeMaxSum(node.rightNode))
        let left = max(0, treeMaxSum(node.leftNode))
        
        return right + left + node.val
    }
   
   
}


