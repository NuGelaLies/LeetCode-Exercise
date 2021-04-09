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
        var items = [[Int]]()
        if root == nil {return items}

        func levelOrder(_ left: TreeNode?, _ right: TreeNode?, level: Int) {
            if left == nil && right == nil {return}
            
            var elements = [Int]()

            if let left = left {
                elements.append(left.val)
            }

            if let right = right {
                elements.append(right.val)
            }

            if !elements.isEmpty {
                if items.count == level {
                    items.append(elements)
                } else {
                    var temp = items[level]
                    temp.append(contentsOf: elements)
                    items[level] = temp
                }
            }
            levelOrder(left?.left, left?.right, level: level+1)
            levelOrder(right?.left, right?.right, level: level+1)
        }
        levelOrder(root?.left, root?.right, level: 0)
        items.reverse()
        items.append([root!.val])
        return items
    }
}
// @lc code=end

