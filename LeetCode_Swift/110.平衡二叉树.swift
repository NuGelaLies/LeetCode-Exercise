/*
 * @lc app=leetcode.cn id=110 lang=swift
 *
 * [110] 平衡二叉树
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
    func isBalanced(_ root: TreeNode?) -> Bool {

        
        func isBalancedValidator(_ root: TreeNode?) -> (Int, Bool) {
            if root == nil { return (0, true) }
            var isLeftBalanced = isBalancedValidator(root?.left)
            if !isLeftBalanced.1 { return isLeftBalanced }
            var isRightBalanced = isBalancedValidator(root?.right)
            if !isRightBalanced.1 { return isRightBalanced }
            let currentHeight = 1 + max(isLeftBalanced.0, isRightBalanced.0)
            return (currentHeight , abs(isLeftBalanced.0 - isRightBalanced.0) <= 1)
        }

        return isBalancedValidator(root).1
    }
}
// @lc code=end

