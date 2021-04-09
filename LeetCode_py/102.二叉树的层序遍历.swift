/*
 * @lc app=leetcode.cn id=102 lang=swift
 *
 * [102] 二叉树的层序遍历
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var items = [[Int]]()

        func levelOrder(_ root: TreeNode?, level: Int) {
            if root == nil {return}

            if items.count == level {
                items.append([root!.val])
            } else {
                var temp = items[level]
                temp.append(root!.val)
                items[level] = temp
            }

            levelOrder(root?.left, level: level+1)
            levelOrder(root?.right, level: level+1)
        }

        levelOrder(root, level: 0)

        return items

    }
}
// @lc code=end

