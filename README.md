# leetCode-for-everyday

---

**个人 LeetCode 练习合集。**

- [目前需要使用的数据结构](#目前需要使用的数据结构)  
- [题解](#题解)
   - [Two Sum](#two-sum)
   - [Add Two Num](#add-two-num)
   - [Merge Two Sorted Lists](#merge-two-sorted-lists)
   - [Binary Tree Maximum Path Sum](#binary-tree-maximum-path-sum)
   - [Longest Substring Without Repeating Characters](#longest-substring-without-repeating-characters)

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

### Merge Two Sorted Lists
Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

**题目大意：合并两个有序链表**

``` Markdown
Example:
Input:  1->2->4, 1->3
Output: 1->1->2->3->4
```

**Code**

``` Swift
func mergeSloted<T: Comparable>(lhs: LinkedNode<T>?, rhs: LinkedNode<T>?) -> LinkedNode<T>? {
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

### Binary Tree Maximum Path Sum
Given a non-empty binary tree, find the maximum path sum.
For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

**题目大意: 给定一个非空二叉树，返回该二叉树最大路径值**

``` Markdown 

Example 1:

Input: [1,2,3]

       1
      / \
     2   3

Output: 6
Example 2:

Input: [-10,9,20,null,null,15,7]

   -10
   / \
  9  20
    /  \
   15   7

Output: 42

```

思路：后序遍历。

**Code**
需要添加一全局变量

`var carry = Int.min`

``` Swift
func treeMaxSum<T>(_ node: TreeNode<T>?) -> T where T: FixedWidthInteger & SignedInteger {
    guard let node = node else {
        return 0
    }
    let right = treeMaxSum(node.rightNode)
    let left = treeMaxSum(node.leftNode)
    carry = max(carry, right+left+node.val)
    return max(right, left) + node.val
}


```

### Longest Substring Without Repeating Characters

Given a string, find the length of the longest substring without repeating characters.

**题目大意: 获取当前字符串中最长不重复的子串**

``` Markdown
Example 1:
Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3. 

Example 2:
Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Example 3:
Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 

Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

**Code**

``` Swift

```