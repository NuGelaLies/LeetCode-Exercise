/*
 * @lc app=leetcode.cn id=101 lang=swift
 *
 * [101] 对称二叉树
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        //MARK: - 递归
        func compare(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
            if left == nil && right == nil {return true}
            if left == nil || right == nil {return false}

            let isLeftSame = compare(left?.left, right?.right) 
            let isRightSame = compare(left?.right, right?.left)

            return left?.val == right?.val && isLeftSame && isRightSame
        }
        return compare(root?.left, root?.right)
    }
}
// @lc code=end

