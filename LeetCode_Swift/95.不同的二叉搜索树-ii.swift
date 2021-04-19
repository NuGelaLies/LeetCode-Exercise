/*
 * @lc app=leetcode.cn id=95 lang=swift
 *
 * [95] 不同的二叉搜索树 II
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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n > 0 else { return [] }

    func generate(_ start: Int, _ end: Int) -> [TreeNode?]{
        if start > end {
            return [nil]
        }
        var trees = [TreeNode?]()
        for rootVal in start...end {
            let leftTrees = generate(start,rootVal - 1)
            let rightTrees = generate(rootVal + 1,end)
            
            for leftItem in leftTrees {
                for rightItem  in rightTrees {
                    let root = TreeNode(rootVal)
                    root.left = leftItem
                    root.right = rightItem
                    trees.append(root)
                }
            }
        }
        return trees
    }   

    return generate(1, n)
    }
}
// @lc code=end

