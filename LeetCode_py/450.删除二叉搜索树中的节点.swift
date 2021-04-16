/*
 * @lc app=leetcode.cn id=450 lang=swift
 *
 * [450] 删除二叉搜索树中的节点
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val < key {
            root.right = deleteNode(root.right, key)
        } else if root.val > key {
            root.left = deleteNode(root.left, key)
        } else {
            if root.left == nil { return root.right } 
            if root.right == nil { return root.left } 
            
            let min = getMin(root.right)
            root.val = min!.val
            root.right = deleteNode(root.right, min!.val)
        }
        return root
    }
     
    func getMin(_ node: TreeNode?) -> TreeNode? {
        var left = node
        while left?.left != nil {
            left = left?.left
        }
        return left
    }
}
// @lc code=end

