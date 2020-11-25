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
        let root = LinkedNode<T>(0)
        var head = root
        var lhc = lhs
        var rhc = rhs
        var carry: T = 0
                
        while lhc != nil || rhc != nil {
            let sum = (lhc?.val ?? 0) + (rhc?.val ?? 0) + carry
            carry = sum / 10
            let remainder = sum % 10
            let newNode = LinkedNode<T>(remainder)
            head.next = newNode
            newNode.previous = head
            head = newNode
            lhc = lhc?.next
            rhc = rhc?.next
        }
                
        if carry > 0 {
            let carryNode = LinkedNode<T>(carry)
            head.next = carryNode
            head = carryNode
        }
                
        return root.next
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
    
    static func treeMaxSum<T>(_ root: BTreeNode<T>?) -> T where T: FixedWidthInteger & BinaryInteger {
        var result: T = 0;
        guard let node = root else { return 0 }
        algo.helper(node, &result)
        return result  
    }
    
    @discardableResult
    static func helper<T>(_ root: BTreeNode<T>?, _ result: inout T) -> T where T: FixedWidthInteger & BinaryInteger {
        guard let root = root else { return 0 }
        let left = max(0, helper(root.leftNode, &result)), right = max(0, helper(root.rightNode, &result))
        result = max(result, root.val + left + right)
        return root.val + max(left, right)
    }
    
   
    // MARK: Longest Substring Without Repeating Characters
    /**
     Given a string s, find the length of the longest substring without repeating characters.
     */
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var lastStringSatrtIndex = 0
        var currentStringLength = 0
        var tempDict = [Character:Int]()
        var currentIndex = s.startIndex
        let count = s.count
        for i in 0 ..< count {
            let subString = s[currentIndex]
            let oldIndex = tempDict[subString]
            if oldIndex != nil &&  oldIndex! >= lastStringSatrtIndex{
                lastStringSatrtIndex = oldIndex! + 1
                currentStringLength = i - lastStringSatrtIndex
                
                
                let willMaxLength = count - lastStringSatrtIndex
                
                if maxLength >= willMaxLength  { return maxLength }
            }
            
            currentStringLength += 1

            maxLength = max(currentStringLength, maxLength)

            tempDict[subString] = i
            currentIndex = s.index(after: currentIndex)
        }
        
        return maxLength
    }
    //MARK: Median of Two Sorted Arrays
    
    /**
     Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

     Folstart up: The overall run time complexity should be O(log (m+n)).
     
     Example 1:

     Input: nums1 = [1,3], nums2 = [2]
     Output: 2.00000
     Explanation: merged array = [1,2,3] and median is 2.
     Example 2:

     Input: nums1 = [1,2], nums2 = [3,4]
     Output: 2.50000
     Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
     Example 3:

     Input: nums1 = [0,0], nums2 = [0,0]
     Output: 0.00000
     Example 4:

     Input: nums1 = [], nums2 = [1]
     Output: 1.00000
     Example 5:

     Input: nums1 = [2], nums2 = []
     Output: 2.00000

     */
    static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count > nums2.count {
            return findMedianSortedArrays(nums2, nums1)
        }
        let lhc = nums1.count
        let rhc = nums2.count
        var sat = 0
        var end = lhc
        while sat <= end {
            let middle_l = (sat + end) / 2
            let middle_r = ((lhc + rhc + 1)/2) - middle_l
            let lhx = middle_l == 0 ? Int.min : nums1[middle_l-1]
            let rhx = middle_l == lhc ? Int.max : nums1[middle_l]
            let lhy = middle_r == 0 ? Int.min : nums2[middle_r-1]
            let rhy = middle_r == rhc ? Int.max  : nums2[middle_r]
            if lhx <= rhy && lhy <= rhx {
                if (lhc + rhc) % 2 == 0 {
                    return Double((max(lhx, lhy) + min(rhx, rhy))) / 2
                } else {
                    return Double(max(lhx, lhy))
                }
            } else if lhx > rhy {
                end = middle_l - 1
            } else {
                sat = middle_l + 1
            }
        }
        return 0.0
    }
}


