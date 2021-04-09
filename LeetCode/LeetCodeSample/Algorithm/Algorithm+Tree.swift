//
//  Algorithm+Tree.swift
//  LeetCodeSample
//
//  Created by NuGelaliee on 3/24/21.
//

import Foundation

extension Algorithm {
    
    // 二叉树翻转
    func invertTree(_ root: BTreeNode<Int>?) -> BTreeNode<Int>? {
        
        if root == nil {return root}
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        _ = invertTree(root?.left)
        _ = invertTree(root?.right)
        return root
        
    }
    
    func connectTree(_ node: LinkedBinaryTree<Int>?) -> LinkedBinaryTree<Int>? {
        if node == nil || node?.left == nil {return node}
        
        func helper(_ left: LinkedBinaryTree<Int>?, _ right: LinkedBinaryTree<Int>?) {
            if left == nil || right == nil {return}
            left?.next = right
            helper(left?.left, left?.right)
            helper(right?.left, right?.right)
            helper(left?.right, right?.left)
        }
        helper(node?.left, node?.right)
        return node
    }

    func flatten(_ root: BTreeNode<Int>?) {
            
        if root == nil {return}
        
        flatten(root?.left)
        flatten(root?.right)
        
        let left = root?.left
        let right = root?.right
        
        root?.left = nil
        root?.right = left
        var node = root
        
        while node?.right != nil {
            node = node?.right
        }
        node?.right = right
    }
    
    func constructMaximumBinaryTree(_ nums: [Int]) -> BTreeNode<Int>? {
        guard !nums.isEmpty else {return nil}
        var max = Int.min, index = 0
        for i in 0..<nums.count {
            if nums[i] > max {
                max = nums[i]
                index = i
            }
        }
        let root = BTreeNode<Int>(nums[index])
        root.left = constructMaximumBinaryTree(Array(nums[0..<index]))
        root.right = constructMaximumBinaryTree(Array(nums[index..<nums.count]))
        return root
    }
 
    func serializeTree(_ node: BTreeNode<Int>?) -> String? {
        var res = [String]()
        func helper(_ node: BTreeNode<Int>?) {
            if node == nil {
                res.append("#")
                return
            }
            helper(node?.left)
            helper(node?.right)
            res.append("\(node?.val ?? 0)")
        }
        
        
        return res.joined()
    }
    
//    
//    func deserialize(_ str: String) -> BTreeNode<Int>? {
//        
//        
//        
//        
//        
//    }
}
