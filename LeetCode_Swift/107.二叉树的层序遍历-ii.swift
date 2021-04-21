/*
 * @lc app=leetcode.cn id=107 lang=swift
 *
 * [107] 二叉树的层序遍历 II
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var items = [[Int]](),res = [[Int]]()
        func levelOrder(_ root: TreeNode?, _ lv: Int) {
            guard let root = root else {return}

            if items.count == lv {
                items.append([root.val])
            } else {
                var temp = items[lv]
                temp.append(root.val)
                items[lv] = temp  
            }  
            levelOrder(root.left, lv+1)
            levelOrder(root.right, lv+1)
        }
        levelOrder(root, 0)


        for i in items {
            res.insert(i, at: 0)
        }

        return res
    }
}
// @lc code=end

