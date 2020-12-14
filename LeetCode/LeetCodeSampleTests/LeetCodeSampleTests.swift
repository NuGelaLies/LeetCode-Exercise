//
//  LeetCodeSampleTests.swift
//  LeetCodeSampleTests
//
//  Created by NuGelaliee on 12/14/20.
//

import XCTest
@testable import LeetCodeSample

class LeetCodeSampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testMedianofTwoSortedArrays() throws {
        var nums1 = [1,3], nums2 = [2]
        XCTAssertEqual(algo.findMedianSortedArrays(nums1, nums2), 2)
        nums1 = [1,2]
        nums2 = [3,4]
        XCTAssertEqual(algo.findMedianSortedArrays(nums1, nums2), 2.5)
        nums1 = []
        nums2 = [1]
        XCTAssertEqual(algo.findMedianSortedArrays(nums1, nums2), 1)
        nums1 = [0,0]
        nums2 = [0,0]
        XCTAssertEqual(algo.findMedianSortedArrays(nums1, nums2), 0)
        nums1 = [2]
        nums2 = []
        XCTAssertEqual(algo.findMedianSortedArrays(nums1, nums2), 2)
        nums1 = [2, 3, 6]
        nums2 = [4, 5]
        XCTAssertEqual(algo.findMedianSortedArrays(nums1, nums2), 4)
    }
    
    func testgreedCoin() throws {
        XCTAssertEqual(algo.greedCoin([1,2,5], 11), 3)
        XCTAssertEqual(algo.greedCoin([1,2,3], 6), 2)
        XCTAssertEqual(algo.greedCoin([1,2,5], 6), 2)
        XCTAssertEqual(algo.greedCoin([], 6), -1)
        XCTAssertEqual(algo.greedCoin([5], 6), -1)
    }
    
    func testNormalCoin() throws {
        XCTAssertEqual(algo.normalCoin([1,2,5], 11), 3)
        XCTAssertEqual(algo.normalCoin([1,2,3], 6), 2)
        XCTAssertEqual(algo.normalCoin([1,2,5], 6), 2)
        XCTAssertEqual(algo.normalCoin([], 6), -1)
        XCTAssertEqual(algo.greedCoin([5], 6), -1)
    }
    
    func testIsPalindrome() throws {
        XCTAssertEqual(algo.isPalindrome(6), true)
        XCTAssertEqual(algo.isPalindrome(123), false)
        XCTAssertEqual(algo.isPalindrome(121), true)
        XCTAssertEqual(algo.isPalindrome(-121), false)
        XCTAssertEqual(algo.isPalindrome(12345), false)
    }
    
    
    func testTwoSum() throws {
        XCTAssertEqual(algo.twoSum(9, elements: [2,7,11,15]), [0, 1])
        XCTAssertEqual(algo.twoSum(6, elements: [3,2,4]), [1, 2])
        XCTAssertEqual(algo.twoSum(6, elements: [3,3]), [0, 1])
        XCTAssertEqual(algo.twoSum(4, elements: []), [])
    }
    
    func testZigZagConversion() throws {
        XCTAssertEqual(algo.zigZagconvert("PAYPALISHIRING", 3), "PAHNAPLSIIGYIR")
        XCTAssertEqual(algo.zigZagconvert("PAYPALISHIRING", 4), "PINALSIGYAHRPI")
        XCTAssertEqual(algo.zigZagconvert("A", 1), "A")
    }

    func testLengthOfLongestSubstring() throws {
        XCTAssertEqual(algo.lengthOfLongestSubstring("abcabcbb"), 3)
        XCTAssertEqual(algo.lengthOfLongestSubstring("bbbbb"), 1)
        XCTAssertEqual(algo.lengthOfLongestSubstring("pwwkew"), 3)
        XCTAssertEqual(algo.lengthOfLongestSubstring(""), 0)
    }
    
    func testLongest() throws {
        XCTAssertEqual(algo.longestPalindrome("babad"), "bab")
        XCTAssertEqual(algo.longestPalindrome("a"), "a")
        XCTAssertEqual(algo.longestPalindrome("cbbd"), "bb")
        XCTAssertEqual(algo.longestPalindrome("ac"), "a")
        
    }
    func testReverseIntger() throws {
        XCTAssertEqual(algo.reverse(123), 321)
        XCTAssertEqual(algo.reverse(-123), -321)
        XCTAssertEqual(algo.reverse(120), 21)
        XCTAssertEqual(algo.reverse(0), 0)
        XCTAssertEqual(algo.reverse(2147483647), 0)
        XCTAssertEqual(algo.reverse(-2147483648), 0)
        XCTAssertEqual(algo.reverse(-21474836400), -463847412)
        XCTAssertEqual(algo.reverse(21474836400), 463847412)
        XCTAssertEqual(algo.reverse(7463847412), 2147483647)
        XCTAssertEqual(algo.reverse(-8463847412), -2147483648)
    }
    
    func testStringtoInteger() throws {
        XCTAssertEqual(algo.myAtoi("42"), 42)
        XCTAssertEqual(algo.myAtoi("+-1"), 0)
        XCTAssertEqual(algo.myAtoi("   -42"), -42)
        XCTAssertEqual(algo.myAtoi("4193 with words"), 4193)
        XCTAssertEqual(algo.myAtoi("words and 987"), 0)
        XCTAssertEqual(algo.myAtoi("-91283472332"), -2147483648)
        XCTAssertEqual(algo.myAtoi("91283472332"), 2147483647)
    }
    
    func testBFfib() throws {
        XCTAssertEqual(algo.bfFib(-6), 0)
        XCTAssertEqual(algo.bfFib(0), 0)
        XCTAssertEqual(algo.bfFib(1), 1)
        XCTAssertEqual(algo.bfFib(2), 1)
        XCTAssertEqual(algo.bfFib(3), 2)
        XCTAssertEqual(algo.bfFib(5), 5)
        XCTAssertEqual(algo.bfFib(6), 8)
        XCTAssertEqual(algo.bfFib(7), 13)
    }
    
    func testFib() throws {
        // 1 1 2 3 5 8 13
        XCTAssertEqual(algo.fib(0), 0)
        XCTAssertEqual(algo.fib(1), 1)
        XCTAssertEqual(algo.fib(2), 1)
        XCTAssertEqual(algo.fib(3), 2)
        XCTAssertEqual(algo.fib(5), 5)
        XCTAssertEqual(algo.fib(6), 8)
        XCTAssertEqual(algo.fib(7), 13)
        XCTAssertEqual(algo.fib(-6), 0)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
