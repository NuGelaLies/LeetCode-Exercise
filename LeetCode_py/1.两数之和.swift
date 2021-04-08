/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 */

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var params = [Int: Int]()

        for index in 0..<nums.count {
            let value = nums[index]
            if let res = params[target - value] {
                return [res, index]
            } else {
                params[value] = index
            }
        }
        return []
    }
}
// @lc code=end

