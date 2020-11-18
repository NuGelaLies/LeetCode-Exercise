# leetCode-for-everyday

---

**个人 LeetCode 练习合集。**

- [目前需要使用的数据结构](#目前需要使用的数据结构)  
- [题解](#题解)
   - [Two Sum](#two-sum)
   - [Add Two Num](#add-two-num)
   - [Merge Two Sorted Lists](#merge-two-sorted-lists)

## 目前需要使用的数据结构

[LinkedList](https://github.com/NuGelaLies/leetCode-for-everyday/blob/main/LeetCodeSample/LeetCodeSample/Common/LinkedList/LinkedList.swift)
[LinkedNode](https://github.com/NuGelaLies/leetCode-for-everyday/blob/main/LeetCodeSample/LeetCodeSample/Common/LinkedList/Nodes/LinkedNode.swift) 

## 题解

### Two Sum
Given an array of integers, return indices of the two numbers such that they add up to a specific target.You may assume that each input would have exactly one solution, and you may not use the same element twice.
     
**题目大意：返回两个数字的下标，而且这两个数字的和等于给定值。不可重复使用统一参数**

``` Markdown
Example: 
Given nums = [2, 7, 11, 15], target = 9,
Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1]
```

**Code**

``` Swift
func twoSum(_ target: Int, elements: [Int]) -> [Int] {
    var params = [Int: Int]()
    for (i, item) in elements.enumerated() {
        if let value = params[target - item] {
            return [value, i]
        } else {
            params[item] = i
        }
    }
    return []
}
```

### Add Two Num

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

**题目大意：两个非空链表，低位相加，然后倒序输出。head val 不为 0**

```
Example: 
Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807
```

**Code**

``` Swift 
func addTwoNum<T>(lhs: LinkedNode<T>?, rhs: LinkedNode<T>?) -> LinkedNode<T>? where T : FixedWidthInteger & SignedInteger {
    let head = LinkedNode<T>(0)
    var lnode = lhs, rnode = rhs, carry = 0, current = head
    while lnode != nil || rnode != nil || carry != 0 {
        if let lnod = lnode {
            carry += lnod.val
            lnode = lnod.next
        }
        if let rnod = rnode {
            carry += rnod.val
            rnode = rnod.next
        }
        let node = LinkedNode<T>(carry % 10)
        carry /= 10
        current.next = node
        node.previous = current //双链表头结点
        current = node
    }
    return head.next
}
```

## Merge Two Sorted Lists
Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

**题目大意：合并两个有序链表**

``` Markdown
Example:
Input:  1->2->4, 1->3
Output: 1->1->2->3->4
```

**Code**

``` Swift
func merge<T: Comparable>(lhs: LinkedNode<T>?, rhs: LinkedNode<T>?) -> LinkedNode<T>? {
    guard let lhs = lhs else {
        return rhs
    }
    guard let rhs = rhs else {
        return lhs
    }
    if lhs.val < rhs.val {
        let temp = mergeNodes(lhs: lhs.next, rhs: rhs)
        lhs.next = temp
        temp?.previous = lhs
        return lhs
    }
    let temp = mergeNodes(lhs: lhs, rhs: rhs.next)
    rhs.next = temp
    temp?.previous = rhs
    return rhs
}

``` 