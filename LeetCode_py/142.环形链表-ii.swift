/*
 * @lc app=leetcode.cn id=142 lang=swift
 *
 * [142] 环形链表 II
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head?.next, fast = head?.next?.next

        while fast?.next != nil && fast !== slow {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {break}
        }

        if fast == nil || fast?.next == nil {return nil}

        slow = head

        while fast !== slow {
            fast = fast?.next
            slow = slow?.next
        }

        return fast
    }
}
// @lc code=end

