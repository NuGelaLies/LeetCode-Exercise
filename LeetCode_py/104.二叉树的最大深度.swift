/*
 * @lc app=leetcode.cn id=104 lang=swift
 *
 * [104] 二叉树的最大深度
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
    func maxDepth(_ root: TreeNode?) -> Int {
        // var count = 0
        // if root == nil {return 0}
        // count = 1
        // func algohelper(_ left: TreeNode?, _ right: TreeNode?, level: Int) {
        //     if left == nil && right == nil { return }
        //     count = max(count, level+1)
        //     algohelper(left?.left, left?.right, level: level+1)
        //     algohelper(right?.left, right?.right, level: level+1)
        // }

        // algohelper(root?.left, root?.right, level: count)

        func maxDepth(_ root: TreeNode?, level: Int) {
            if root == nil {return}

            maxDepth(root?.left, level: level+1)
            maxDepth(root?.right, level: level+1)

            count = max(count, level+1)
        }
        


        maxDepth(root, level: 0)

        return count

    }
}
// @lc code=end

