/*
 * @lc app=leetcode.cn id=116 lang=swift
 *
 * [116] 填充每个节点的下一个右侧节点指针
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        
        func connect(_ left: Node?, _ right: Node?) {
            if left == nil || right == nil { return }
            left?.next = right

            connect(left?.left, left?.right)
            connect(left?.right, right?.left)
            connect(right?.left, right?.right)
        }

        connect(root?.left, root?.right)

        return root
    }
}
// @lc code=end

