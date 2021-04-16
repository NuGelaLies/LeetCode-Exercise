/*
 * @lc app=leetcode.cn id=98 lang=swift
 *
 * [98] 验证二叉搜索树
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        //MARK: - 二叉搜索树，左边叶子节点永远最小，右面永远最大，根节点 比左节点大，比右节点小

        func isValidBST(_ root: TreeNode?, _ min: TreeNode?, _ max: TreeNode?) -> Bool {
            if root == nil {return true}
            if min != nil && root!.val <= min!.val {return false}
            if max != nil && root!.val >= max!.val {return false}

            return isValidBST(root?.left, min, root) && isValidBST(root?.right, root, max)
        }
        
        return isValidBST(root, nil, nil)
    }
}
// @lc code=end

