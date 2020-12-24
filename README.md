# leetCode-for-everyday

---
[![Build Status](https://www.travis-ci.org/NuGelaLies/LeetCode-for-everyday.svg?branch=master)](https://www.travis-ci.org/NuGelaLies/LeetCode-for-everyday)
[![codecov](https://codecov.io/gh/NuGelaLies/LeetCode-for-everyday/branch/master/graph/badge.svg?token=P26KL416ZX)](https://codecov.io/gh/NuGelaLies/LeetCode-for-everyday)

**个人 LeetCode 练习合集。**

- [目前需要使用的数据结构](#目前需要使用的数据结构)  
- [题解](#题解)
   - [Two Sum](#two-sum)
   - [Add Two Num](#add-two-num)
   - [Merge Two Sorted Lists](#merge-two-sorted-lists)
   - [Binary Tree Maximum Path Sum](#binary-tree-maximum-path-sum)
   - [Longest Substring Without Repeating Characters](#longest-substring-without-repeating-characters)
   - [Median of Two Sorted Arrays](#median-of-two-sorted-arrays)
   - [ZigZag Conversion](#zigzag-conversion)
   - [Reverse Integer](#reverse-integer)
   - [String to Integer (atoi)](#string-to-integer-atoi)
   - [Palindrome Number](#palindrome-number)
   - [Coin Change](#coin-change)
   - [Fibonacci Number](#)
   - [Binary Search](#binary-search)
   - [Container With Most Water](#)

## 目前需要使用的数据结构

[LinkedList](https://github.com/NuGelaLies/leetCode-for-everyday/blob/main/LeetCodeSample/LeetCodeSample/Common/LinkedList/LinkedList.swift)
[LinkedNode](https://github.com/NuGelaLies/leetCode-for-everyday/blob/main/LeetCodeSample/LeetCodeSample/Common/LinkedList/Nodes/LinkedNode.swift) 
[TreeNode](https://)

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
    let root = LinkedNode<T>(0)
    var head = root
    var lhc = lhs
    var rhc = rhs
    var carry: T = 0
                
    while lhc != nil || rhc != nil {
        let sum = (lhc?.val ?? 0) + (rhc?.val ?? 0) + carry
        carry = sum / 10
        let remainder = sum % 10
        let newNode = LinkedNode<T>(remainder)
        head.next = newNode
        newNode.previous = head
        head = newNode
        lhc = lhc?.next
        rhc = rhc?.next
    }
                
    if carry > 0 {
        let carryNode = LinkedNode<T>(carry)
        head.next = carryNode
        head = carryNode
    }       
    return root.next
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

**题目大意: 给定一个非空二叉树，至少包含一个节点，不一定需要通过根节点，返回该二叉树最大路径和**

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

``` Swift

@discardableResult
func helper<T>(_ root: BTreeNode<T>?, _ result: inout T) -> T where T: FixedWidthInteger & BinaryInteger {
    guard let root = root else { return 0 }
    let left = max(0, helper(root.leftNode, &result))
    let right = max(0, helper(root.rightNode, &result))
    result = max(result, root.val + left + right)
    return root.val + max(left, right)
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
func lengthOfLongestSubstring(_ s: String) -> Int {
    var maxLength = 0
    var lastStringSatrtIndex = 0
    var currentStringLength = 0
    var tempDict = [Character:Int]()
    var currentIndex = s.startIndex
    let count = s.count
    for i in 0 ..< count {
        let subString = s[currentIndex]
        let oldIndex = tempDict[subString]
        if oldIndex != nil &&  oldIndex! >= lastStringSatrtIndex{
            lastStringSatrtIndex = oldIndex! + 1
            currentStringLength = i - lastStringSatrtIndex
            let willMaxLength = count - lastStringSatrtIndex
            if maxLength >= willMaxLength  { return maxLength }
        }
            
        currentStringLength += 1

        maxLength = max(currentStringLength, maxLength)

        tempDict[subString] = i
        currentIndex = s.index(after: currentIndex)
    }
    return maxLength
}

```

### Median of Two Sorted Arrays

Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

Follow up: The overall run time complexity should be `O(log (m+n)).`

**题目大意: 把两个已排序的数组合并，并返回位于数组中间的值**

**Example 1:**

```Markdown
Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.
```

**Example 2:**

```Markdown
Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
```
**Example 3:**

```Markdown
Input: nums1 = [0,0], nums2 = [0,0]
Output: 0.00000
```

**Example 4:**

```Markdown
Input: nums1 = [], nums2 = [1]
Output: 1.00000
```

**Example 5:**

```Markdwon
Input: nums1 = [2], nums2 = []
Output: 2.00000

```

**Code**

```Swift
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let aCount = nums1.count, bCount = nums2.count
    var left = 0 , right = 0, aIndex = 0, bIndex = 0
    let length = (aCount + bCount) / 2
    for _ in 0...length {
        left = right
        if (aIndex < aCount && (bIndex >= bCount || nums1[aIndex] < nums2[bIndex])) {
            right = nums1[aIndex]
            aIndex += 1
        } else {
            right = nums2[bIndex]
            bIndex += 1
        }
    }
    if (aCount + bCount) % 2 == 0 {
        return Double(left + right) / 2
    } else {
        return Double(right)
    }
}

```

### ZigZag Conversion

The string `PAYPALISHIRING` is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

And then read line by line: `PAHNAPLSIIGYIR`

Write the code that will take a string and make this conversion given a number of rows:

```
string convert(string s, int numRows);
```

**Example 1:**

```Markdown
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"

Explanation:
P   A   H   N
A P L S I I G
Y   I   R
```

**Example 2:**

```Markdown
Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"

Explanation:
P     I    N
A   L S  I G
Y A   H R
P     I
```

**Example 3:**

```Markdown
Input: s = "A", numRows = 1
Output: "A"
```

**题目大意: Z字变换，将字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。**

**Code**

```Swift
func zigZagconvert(_ s: String, _ numRows: Int) -> String {
    guard numRows >= 2 && s.count > 1 else {
        return s
    }
    let minCount = min(s.count, numRows)
    var contents = Array<String>(repeating: "", count: minCount)
    var rowIndex = 0
    var isReversed = false
    for index in 0..<s.count {
        let subIndex = s.index(s.startIndex, offsetBy: index)
        contents[rowIndex] += String(s[subIndex])
        rowIndex += isReversed ? -1 : 1
        if rowIndex == (numRows - 1) || rowIndex == 0 { isReversed.toggle() }
        print(contents)
    }
    return contents.joined()
}
```

### Reverse Integer

Given a 32-bit signed integer, reverse digits of an integer.

**Note:**

Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: `[−2^31,  2^31 − 1]`. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

**Example 1:**

```Markdown
Input: x = 123
Output: 321
```

**Example 2:**

```Markdown
Input: x = -123
Output: -321
```

**Example 3:**

```Markdown
Input: x = 120
Output: 21
```

**Example 4:**

```Markdown
Input: x = 0
Output: 0
```

**Constraints:**
`-2^31 <= x <= 2^31 - 1`

**大意：给出一个32位整数，要求翻转输出，当计算溢出后返回0**

**Code**

```Swift
func reverse(_ x: Int) -> Int {
    guard integer != 0 else {return integer}
    var num = integer, result = 0
    while num != 0 {
        let carry = num % 10
        result = result * 10 + carry
        guard result <= Int(Int32.max) && result >= Int(Int32.min) else {
            return 0
        }
        num /= 10
    }
    return result
}
```

### String to Integer (atoi)

Implement atoi which converts a string to an integer.

The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
 
If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

If no valid conversion could be performed, a zero value is returned.

**大意: 字符串转换整数，字符串开头只允许存在一个符号 + 或 - 在数字前, 空格除外 ，所有不符合条件的返回值都为0**

**Example 1:**

```Markdown
Input: str = "42"
Output: 42
```


**Example 2:**

```Markdown
Input: str = "   -42"
Output: -42
Explanation: The first non-whitespace character is '-', which is the minus sign. Then take as many numerical digits as possible, which gets 42.
```

**Example 3:**

```Markdown
Input: str = "4193 with words"
Output: 4193
Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
```

**Example 4:**

```Markdown
Input: str = "words and 987"
Output: 0
Explanation: The first non-whitespace character is 'w', which is not a numerical digit or a +/- sign. Therefore no valid conversion could be performed.
```

**Example 5:**

```Markdown
Input: str = "-91283472332"
Output: -2147483648
Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer. Thefore INT_MIN (−231) is returned.
```

**Code**

```Swift

func myAtoi(_ s: String) -> Int {
    var result: Int32 = 0
    var sign = 1, started = false
    for char in s {
        if char == " " {
           if started { break }
        } else if char == "-" {
            sign = -1
            if started { break }
            started = true
        } else if char == "+" {
            if started { break }
            started = true
        } else if char >= "0" && char <= "9" {
            let digit = Int32(char.utf8.first! - "0".first!.utf8.first!)
            if sign > 0 {
                if result > Int32.max / 10 || (result == Int32.max / 10 && digit > Int32.max % 10) {
                    return Int(Int32.max)
                } else {
                    result = result * 10 + digit
                }
            } else {
                if result < Int32.min / 10 || (result == Int32.min / 10 && -digit < Int32.min % 10) {
                    return Int(Int32.min)
                } else {
                    result = result * 10 - digit
                }
            }
            started = true
        } else {
            break
        }
    }
    return Int(result)
}

```

### Palindrome Number

Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

**Follow up:** Could you solve it without converting the integer to a string?

**判断一个数是否为回文数**

**Example 1:**

```Markdown
Input: x = 121
Output: true
```

**Example 2:**

```Markdown
Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
```

**Example 3:**

```Markdown
Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
```

**Example 4:**

```Markdown
Input: x = -101
Output: false
```

**Code**

```Swift
func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else { return false }
    var value = x, temp = 0
    while value != 0 {
        let carry = value % 10
        temp = temp * 10 + carry
        value = value / 10
    }
    return temp == x
}
```

### Longest Palindromic Substring

Given a string s, return the longest palindromic substring in s.

**输入一个字符串，返回一个最长回文串**

**Example 1:**

```Markdown
Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.
```

**Code**

```Swift

func expand(_ string: [Character], left: Int, right: Int) -> (left: Int, right: Int) {
    var step = 0
    while left - step >= 0 && right + step < string.count && string[left - step] == string[right + step] {
       step += 1
    }
    return (left - step + 1, right + step - 1)
}

func longestPalindrome(_ s: String) -> String {
    let string = Array(s)
    var left = 0
    var right = 0
    for index in string.indices {
        let odd = expand(string, left: index, right: index)
        let even = expand(string, left: index, right: index + 1)
        if odd.right - odd.left > even.right - even.left {
            if odd.right - odd.left > right - left {
                left = odd.left
                right = odd.right
           }
        } else {
           if even.right - even.left > right - left {
                left = even.left
                right = even.right
            }
        }
    }
    return String(string[left...right])
}

```

### Coin Change

You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return `-1`.

You may assume that you have an infinite number of each kind of coin.

**Example 1:**

```Markdown
Input: coins = [1,2,5], amount = 11
Output: 3
Explanation: 11 = 5 + 5 + 1
```

**Example 2:**

```Markdown
Input: coins = [2], amount = 3
Output: -1
```

**Example 3:**

```Markdown
Input: coins = [1], amount = 0
Output: 0
```

**Example 4:**

```Markdown
Input: coins = [1], amount = 1
Output: 1
```

**Example 5:**

```Markdown
Input: coins = [1], amount = 2
Output: 2
```

**Constraints:**

1 <= coins.length <= 12
1 <= coins[i] <= 2<sup>31</sup> - 1 
0 <= amount <= 10<sup>4</sup>

先处理处理状态方程，写出递归树，最优子结构，

**状态方程**
$$ 
f(n) =
\begin{cases}
0,  n = 0\\
-1, n < 0\\
min(dp(n), 1 + dp(n-coin)), n > 0
\end{cases}
$$

1. **带备忘录的递归解法**

```Swift
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dict: [Int: Int] = [:], res = Int.max
    dict[0] = 0
    func helper(_ amount: Int) -> Int {
        if amount == 0 {return 0}
        if amount < 0 {return -1}
        if let value = dict[amount] {return value}
        for coin in coins {
            let subitem = helper(amoount - coin) 
            if subitem == -1 {continue}
            res = min(res, 1 + subitem)
        }
        res = res != Int.max ? res : -1
        dict[amount] = res
        return res
    }
    return helper(amount)
}
```

2. **迭代解法(贪心算法)**

```Swift
func greedCoin(_ coins: [Int], _ amount: Int) -> Int {
    if coins.isEmpty { return -1 }
	let sort = coins.sorted(by: >)
    var res = Int.max
        
    func helper(index: Int, amount: Int, coinCount: Int) {
        let coin = sort[index] 
        if amount % coin == 0 {
            res = min(res, coinCount+amount/coin)
        } else if index < coins.count - 1 {
            var needCount = amount/coin
            while needCount >= 0, needCount+coinCount < res {
                helper(index: index+1, amount: amount-coin*needCount, coinCount: coinCount+needCount)
                needCount -= 1
            }
        }
    }
    helper(index: 0, amount: amount, coinCount: 0)
    return res == Int.max ? -1 : res
}
```

### Fibonacci Number

The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

```Markdown
F(0) = 0,   F(1) = 1
F(N) = F(N - 1) + F(N - 2), for N > 1.
```

**状态方程式**

$$
f(n) = 
\begin{cases}
0, n = 0\\
1, n = 1, 2\\
f(n - 1) + f(n - 2), n > 2
\end{cases}
$$

**Code**

```Swift

// 带备忘的递归
func bfFib(_ N: Int) -> Int {
    var dict = [Int: Int]()
    dict[0] = 0; dict[1] = 1; dict[2] = 1
    func helper(_ N: Int) -> Int {
        guard let value = dict[N] else {
        let target = bfFib(N - 1) + bfFib(N - 2)
        dict[N] = target
        return target
        }
        return value
    }
    guard N >= 0 else {return 0}
    return helper(N)
}
    
// 剪枝后迭代
func fib(_ N: Int) -> Int {
    if N == 0 { return 0 }
    if N == 1 || N == 2 { return 1 }
    var current = 1, prev = 1, index = 3
    while index <= N {
        let sum = prev + current
        prev = current
        current = sum
        index += 1
    }
    return current
}
```

### Binary Search

Given a sorted (in ascending order) integer array nums of n elements and a `target` value, write a function to search `target` in `nums`. If `target` exists, then return its index, otherwise return `-1`.

二分查找

**Example 1:**

```Markdown
Input: nums = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in nums and its index is 4
```

**Example 2:**

```Markdown
Input: nums = [-1,0,3,5,9,12], target = 2
Output: -1
Explanation: 2 does not exist in nums so return -1
```

**Code**

```Swift
func  binarySearch(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count - 1
    while left <= right {
        let mid = (right + left) / 2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return -1
}
```

### Container With Most Water

Given n non-negative integers `a1, a2, ..., an` , where each represents a point at coordinate `(i, ai)`. n vertical lines are drawn such that the two endpoints of the line `i` is at `(i, ai)` and `(i, 0)`. Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.

**Code**

```Swift
func maxArea(_ height: [Int]) -> Int {
    var result = Int.min, left = 0, right = height.count - 1
    while left < right {
      let leftvalue = height[left], rightValue = height[right]
      let value = min(leftvalue, rightValue) * (right - left)
      result = max(value, result)
      if leftvalue > rightValue {
          right -= 1
      } else {
          left += 1
      }
    }
  return result
}
```


