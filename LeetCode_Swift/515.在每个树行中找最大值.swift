/*
 * @lc app=leetcode.cn id=515 lang=swift
 *
 * [515] 在每个树行中找最大值
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
    func largestValues(_ root: TreeNode?) -> [Int] {
        var items = [Int]()
            
        func largest(_ left: TreeNode?, _ right: TreeNode?, _ lv: Int) {
            if left == nil && right == nil {return}
            if left != nil && right == nil {
                if items.count == lv {
                    items.append(left!.val)
                } else {
                    let v = items[lv]
                    items[lv] = max(v, left!.val)
                }
            } else if left == nil && right != nil {
                if items.count == lv {
                    items.append(right!.val)
                } else {
                    let v = items[lv]
                    items[lv] = max(v, right!.val)
                }
            } else {
                if items.count == lv {
                    let v = max(left!.val, right!.val)
                    items.append(v)
                } else {
                    let v = items[lv]
                    items[lv] = getMax(left!.val, right!.val, v)
                }
            }

            largest(left?.left, left?.right, lv+1)
            largest(right?.left, right?.right, lv+1)
        }
        if root == nil { return [] }
        items.append(root!.val)
        largest(root?.left, root?.right, 1)
        return items
    }

    func getMax(_ v1: Int,_ v2: Int,_ v3: Int) -> Int {
        return max(max(v1, v2), v3)
    }
}


// @lc code=end

