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
        if root == nil {return items}
        //MARK: - 递归
        func levelOrder(_ root: TreeNode?, level: Int) {
            var elements = [Int]()
            if root == nil {return}

            if items.count == level {
                items.append([root!.val])
            } else {
                var temp = items[level]
                temp.append(root!.val)
                items[level] = temp
            }

            if let left = root?.left {
                levelOrder(left, level: level + 1)
            }

            if let right = root?.right {
                levelOrder(right, level: level + 1)
            }
        }

        func join(_ left: TreeNode?, _ right: TreeNode?, level: Int) {
            if left == nil && right == nil { return }
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
            join(left?.left, left?.right, level: level + 1)
            join(right?.left, right?.right, level: level + 1)

        }

       // levelOrder(root, level: 0)

        items.append([root!.val])
        join(root?.left, root?.right, level: 1)

        return items
        
    }
}
// @lc code=end

