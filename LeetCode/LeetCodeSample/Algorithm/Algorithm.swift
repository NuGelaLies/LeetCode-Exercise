//
//  Algorithm.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

protocol Algorithm { }



extension Algorithm {
    //MARK: - Two Sum
    /**
     
     Given an array of integers, return indices of the two numbers such that they add up to a specific
     target.
     You may assume that each input would have exactly one solution, and you may not use the same
     element twice.
     
     Example:
     
     Given nums = [2, 7, 11, 15], target = 9,
     Because nums[0] + nums[1] = 2 + 7 = 9,
     return [0, 1]
     */
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
    
    //MARK: - add Two Num
    /**
     You are given two non-empty linked lists representing two non-negative integers. The digits are
     stored in reverse order and each of their nodes contain a single digit. Add the two numbers and
     return it as a linked list.
     You may assume the two numbers do not contain any leading zero, except the number 0 itself
     
     Example:
     
     Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
     Output: 7 -> 0 -> 8
     Explanation: 342 + 465 = 807.
     
     */
    func addTwoNum<T>(default value: T, lhs: LinkedNode<T>?, rhs: LinkedNode<T>?) -> LinkedNode<T>? where T : FixedWidthInteger & SignedInteger {
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
    
    func addTwoNum<T>(default value: T, lhs: LinkedList<T>, rhs: LinkedList<T>) -> LinkedList<T> where T : FixedWidthInteger & SignedInteger {
        var node = addTwoNum(default: value, lhs: lhs.head, rhs: rhs.head)
        let list = LinkedList<T>()
        while let nod = node {
            node = nod.next
            swap(&nod.previous, &nod.next)
            list.head = nod
        }
        return list
    }
    
    
    //MARK: - Merge Two Sorted Lists
    /**
     Example:
     
     Input: 1->2->4, 1->3
     Output: 1->1->2->3->4
     */
    func mergeNodes<T: Comparable>(lhs: LinkedNode<T>?, rhs: LinkedNode<T>?) -> LinkedNode<T>? {
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
    
    func mergeSloted<T: Comparable>(lhs: LinkedList<T>, rhs: LinkedList<T>) -> LinkedList<T> {
        guard let lnode = lhs.head else { return rhs }
        guard let rnode = rhs.head else { return lhs }
        if lnode.val < rnode.val {
            lnode.next = mergeNodes(lhs: lnode.next, rhs: rnode)
            return lhs
        }
        rnode.next = mergeNodes(lhs: lnode, rhs: rnode.next)
        return rhs
    }
    
    //MARK: - Binary Tree Maximum Path Sum
    /**
     Given a non-empty binary tree, find the maximum path sum.
     For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.
     */
    
    func treeMaxSum<T>(_ root: BTreeNode<T>?) -> T where T: FixedWidthInteger & BinaryInteger {
        
        @discardableResult
        func helper<T>(_ root: BTreeNode<T>?, _ result: inout T) -> T where T: FixedWidthInteger & BinaryInteger {
            guard let root = root else { return 0 }
            let left = max(0, helper(root.left, &result)), right = max(0, helper(root.right, &result))
            result = max(result, root.val + left + right)
            return root.val + max(left, right)
        }
        
        var result: T = 0;
        guard let node = root else { return 0 }
        helper(node, &result)
        return result  
    }
    
    // MARK: Longest Substring Without Repeating Characters
    /**
     Given a string s, find the length of the longest substring without repeating characters.
     */
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
    //MARK: Median of Two Sorted Arrays
    
    /**
     Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

     Folstart up: The overall run time complexity should be O(log (m+n)).
     
     Example 1:

     Input: nums1 = [1,3], nums2 = [2]
     Output: 2.00000
     Explanation: merged array = [1,2,3] and median is 2.
     Example 2:

     Input: nums1 = [1,2], nums2 = [3,4]
     Output: 2.50000
     Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
     Example 3:

     Input: nums1 = [0,0], nums2 = [0,0]
     Output: 0.00000
     Example 4:

     Input: nums1 = [], nums2 = [1]
     Output: 1.00000
     Example 5:

     Input: nums1 = [2], nums2 = []
     Output: 2.00000
     */
    
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
    
    //MARK: Longest Palindromic Substring
    
    /**
     Given a string s, return the longest palindromic substring in s.
     
     Example 1:

     Input: s = "babad"
     Output: "bab"
     Note: "aba" is also a valid answer.

     Example 2:

     Input: s = "cbbd"
     Output: "bb"
     Example 3:
     
     */
    func longestPalindrome(_ s: String) -> String {
        
        func expand(_ string: [Character], left: Int, right: Int) -> (left: Int, right: Int) {
            var step = 0
            while left - step >= 0 && right + step < string.count && string[left - step] == string[right + step] {
                step += 1
            }
            return (left - step + 1, right + step - 1)
        }
        
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
    
    //MARK: - ZigZag Convert
    func zigZagconvert(_ s: String, _ numRows: Int) -> String {
        guard numRows >= 2 && s.count > 1 else {
            return s
        }
        let minCount = min(s.count, numRows)
        var contents = Array<String>(repeating: "", count: minCount)
        var rowIndex = 0
        var isReversed = false
        for element in s {
            contents[rowIndex] += String(element)
            rowIndex += isReversed ? -1 : 1
            if rowIndex == (numRows - 1) || rowIndex == 0 { isReversed.toggle() }
        }
        return contents.joined()
    }
    
    //MARK: - Reverse Integer
    
    /**
     Given a 32-bit signed integer, reverse digits of an integer.
     */
    
    func reverse(_ integer: Int) -> Int {
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
    
    //MARK: - String to Integer (atoi)
    
    /**
     Implement atoi which converts a string to an integer.

     The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

     The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.

     If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

     If no valid conversion could be performed, a zero value is returned.
     */

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
    //MARK: -  Palindrome Number
    
    /**
     Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

     - Follow up: Could you solve it without converting the integer to a string?
     
     Example 1:

     Input: x = 121
     Output: true
     
     Example 2:

     Input: x = -121
     Output: false
     Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
     
     Example 3:

     Input: x = 10
     Output: false
     Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
     
     Example 4:

     Input: x = -101
     Output: false
     
     */
    
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
    
    
    func bfFib(_ N: Int) -> Int {
        var dict = [Int: Int]()
        dict[0] = 0; dict[1] = 1; dict[2] = 1
        func helper(_ n: Int) -> Int {
            guard let value = dict[n] else {
                let target = helper(n - 1) + helper(n - 2)
                dict[n] = target
                return target
            }
            return value
        }
        guard N >= 0 else {return 0}
        return helper(N)
    }
    
    func fib(_ N: Int) -> Int {
        if N <= 0 {return 0}
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

    //MARK: - 找零钱
    
    //贪心算法 + dfk
    /**
    时间复杂度: O(nlogn)
    */
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

    //递归算法
    /**
    时间复杂度: O(k*n^k)
    */
    func normalCoin(_ coins: [Int], _ amount: Int) -> Int {
        var dict: [Int: Int] = [:]
        dict[0] = 0
        func helper(_ amount: Int) -> Int {
            if amount == 0 {return 0}
            if amount < 0 {return -1}
            var res = Int.max
            if let value = dict[amount] {return value}
            for coin in coins {
                let subitem = helper(amount - coin)
                if subitem == -1 {continue}
                res = min(res, 1+subitem)
            }
            
            res = res != Int.max ? res : -1
            dict[amount] = res
            return res
        }
        
        return helper(amount)
    }
    
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
    
    //MARK: - Integer to Roman
    func intToRoman(_ num: Int) -> String {
        var sb = "", sum = num
        while sum > 0 {
           if sum >= 1000 {
               sb.append("M");
               sum -= 1000;
           } else if sum >= 900 {
               sb.append("CM");
               sum -= 900;
           } else if sum >= 500 {
               sb.append("D");
               sum -= 500;
           } else if sum >= 400 {
               sb.append("CD");
               sum -= 400;
           } else if sum >= 100 {
               sb.append("C");
               sum -= 100;
           } else if sum >= 90 {
               sb.append("XC");
               sum -= 90;
           } else if sum >= 50 {
               sb.append("L");
               sum -= 50;
           } else if sum >= 40 {
               sb.append("XL");
               sum -= 40;
           } else if sum >= 10 {
               sb.append("X");
               sum -= 10;
           } else if sum >= 9 {
               sb.append("IX");
               sum -= 9;
           } else if sum >= 5 {
               sb.append("V");
               sum -= 5;
           } else if sum >= 4 {
               sb.append("IV");
               sum -= 4;
           } else if sum >= 1 {
               sb.append("I");
               sum -= 1;
           }
       }
       return sb
    }
    
    //MARK: -3Sum
    
    func threeSumClosest(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }
        
        var res: [[Int]] = []
        let sorted = nums.sorted()
        
        for i in 0..<nums.count - 2 {
            if i > 0 && sorted[i] == sorted[i - 1] {
                continue
            }
            var m = i + 1, n = sorted.count - 1
            let sum = sorted[i], remainingSum = -sum
            
            while m < n {
                if remainingSum == sorted[m] + sorted[n] {
                    res.append([sum, sorted[m], sorted[n]])
                    
                    repeat {
                        m += 1
                    } while m < n && sorted[m] == sorted[m - 1]
                    
                    repeat {
                        n -= 1
                    } while m < n && sorted[n] == sorted[n + 1]
                    
                } else if remainingSum < sorted[m] + sorted[n] {
                    n -= 1
                } else {
                    m += 1
                }
            }
        }
        return res
    }
    
    //MARK: - 3Sum
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        
        guard nums.count >= 3 else {
            return res
        }
        
        let nums = nums.sorted()
        
        for i in 0..<nums.count - 2 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            
            let firstNum = nums[i], remainingSum = -firstNum
            var m = i + 1, n = nums.count - 1
            
            while m < n {
                if nums[m] + nums[n] == remainingSum {
                    res.append([firstNum, nums[m], nums[n]])
                    
                    repeat {
                        m += 1
                    } while nums[m] == nums[m - 1] && m < n
                    
                    repeat {
                        n -= 1
                    } while nums[n] == nums[n + 1] && m < n
                } else if nums[m] + nums[n] < remainingSum {
                    m += 1
                } else {
                    n -= 1
                }
            }
        }
        return res
    }
    
    func lengthest(_ s: String) -> [String] {
        
        let items = Array(s)
        var result = [Int: Int]()
        var left = 0, maxLength = Int.min
        
        var windows = [Character: Int]()
        
        for right in 0..<items.count {
            let item = items[right]
            
            windows[item, default: 0] += 1
            
            while windows[item]! > 1 {
                let litem = items[left]
                windows[litem]! -= 1
                left += 1
            }
            print(String(items[left...right]))
            if right - left >= maxLength {
                maxLength = right - left
                result[left] = right
            }
        }
        
        var res = [String]()
        
        result.forEach { (k, v) in
            if v - k == maxLength {
                res.append(String(items[k...v]))
            }
        }
        
        return res
    }
    
    func minWindow(_ s: String, _ t: String) -> String {
        if s.isEmpty || t.isEmpty {return ""}
        
        var needs = [Character: Int](), windows = [Character: Int]()
        var left = 0, matchedLeft = 0, matchedRight = 0
        var matched = 0, minLength = Int.max
        
        let items = Array(s)
        
        for c in t {
            needs[c, default: 0] += 1
        }
        
        for right in 0..<items.count {
            let ritem = items[right]
            
            if needs[ritem] == nil {continue}
            
            windows[ritem, default: 0] += 1
            
            if needs[ritem] == windows[ritem] {
                matched += 1
            }
            
            while matched == needs.count {
                let litem = items[left]
                
                if right - left < minLength {
                    matchedLeft = left
                    matchedRight = right
                    minLength = right - left
                    print(String(items[left...right]))
                }
                left += 1
                if needs[litem] == nil {continue}
                if needs[litem] == windows[litem] {
                    matched -= 1
                }
                
                windows[litem]! -= 1
            }
            
        }
        return minLength == Int.max ? "" : String(items[matchedLeft...matchedRight])
    }
    
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        if s1.count > s2.count {return false}
        
        var left = 0, right = 0, matched = 0
        let contains = [Character](s2)
        var needs = [Character: Int](), window = [Character: Int]()
        for c in s1 {
            needs[c, default: 0] += 1
        }
        
        while right < s2.count {
            let char = contains[right]
            right += 1
            guard let value = needs[char] else {continue}
            
            window[char, default: 0] += 1
            
            if value == window[char] {
                matched += 1
            }
            
            while matched == window.count {
                
                let cChar = contains[left]
                left += 1
                guard let wValue = needs[cChar] else {continue}
                
                if wValue == window[cChar] {
                    matched -= 1
                }
                window[cChar]! -= 1
            }
        }
        return false
    }
    
    func hasCycle(_ head: LinkedNode<Int>?) -> Bool {
        var fast = head?.next?.next
        var slow = head?.next
        while(fast != nil && fast !== slow) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return fast != nil
    }
    
    func detectCycle(_ head: LinkedNode<Int>?) -> LinkedNode<Int>? {
        var slow = head?.next
        var fast = head?.next?.next
        
        while fast != nil && fast !== slow {
            fast = fast?.next?.next
            slow = slow?.next
            
            if fast === slow { break }
        }
        
        if fast == nil || fast?.next == nil {return nil}
        
        slow = head
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        return fast
    }
    
    func reverse(_ items: [Int]) -> [Int] {
        var copy = items
        var left = 0
        var right = items.count - 1
        
        while left < right {
            let temp = copy[left]
            copy[left] = copy[right]
            copy[right] = temp
            right -= 1
            left += 1
        }
        return copy
    }
    
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty {return 0}
        var plies = 0, items = Array(repeating: 0, count: nums.count)
        // [6,3,5,10,11,2,9,14,13,7,4,8,12]
        for i in 0..<nums.count {
            var left = 0, right = plies
            let current = nums[i]
            while left < right {
                let mid = (right + left) / 2
                if items[mid] < current {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            if left == plies {plies += 1}
            items[left] = current
        }
        return plies
    }
    
    func minDistance(_ s1: String, _ s2: String) -> Int {
        
        var dpTree = [Int: [Int]]()
        
        for i in 0..<s1.count {
            dpTree[i] = Array(repeating: 0, count: s2.count)
            dpTree[i]?[0] = i
        }
        
        for j in 0..<s2.count {
            dpTree[0]?[j] = j
        }
        
        func mindistance(_ v1: Int, _ v2: Int, _ v3: Int) -> Int {
            return min(min(v1, v2), v3)
        }
        
        func dp(_ v1: Int, _ v2: Int) -> Int {
            
            if v1 == -1 { return v2 + 1 }
            if v2 == -1 { return v1 + 1 }
            
            let i1 = s1.index(s1.startIndex, offsetBy: v1)
            let i2 = s2.index(s2.startIndex, offsetBy: v2)
            if s1[i1] == s2[i2] {
                dpTree[v1]![v2] = dp(v1 - 1, v2 - 1) // skip
            } else {
                dpTree[v1]![v2] = mindistance(dp(v1 - 1, v2 - 1) + 1, // replace
                                   dp(v1, v2 - 1) + 1, // insert
                                   dp(v1 - 1, v2) + 1)  // remove
            }
            
            return dpTree[v1]![v2]
        }
       
        return dp(s1.count - 1, s2.count - 1)
    }
    
    // O(k * log(n))
    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        func helper(_ eggs: Int, _ floors: Int) -> Int {
            if eggs == 1 {return floors}
            if floors == 0 {return floors}
            var res = Int.max
            var low = 0 , high = floors
            while low <= high {
                let mid = (low + high) / 2
                let broken = helper(eggs - 1, mid - 1)
                let unbroken = helper(eggs, floors - mid)
                if broken > unbroken {
                    high = mid - 1
                    res = min(res, broken + 1)
                } else {
                    low = mid + 1
                    res = min(res, unbroken + 1)
                }
            }
            return res
        }
        return helper(K, N)
    }
    
    //O(n)
    func superEggDrop2(_ K: Int, _ N: Int) -> Int {
        var dp = Array(repeating: 0, count: K + 1)
        var res = 0;
        while dp[K] < N {
            for i in (1...K).reversed() {
                dp[i] = dp[i] + dp[i - 1] + 1
            }
            res += 1
        }
        return res
    }
    
 
}

