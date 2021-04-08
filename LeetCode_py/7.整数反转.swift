/*
 * @lc app=leetcode.cn id=7 lang=swift
 *
 * [7] 整数反转
 */

// @lc code=start
class Solution {
    func reverse(_ x: Int) -> Int {
        
        var sym = x > 0 ? 1 : -1
        var temp = abs(x), res = 0
        while temp > 0 {
            let v = temp % 10
            temp /= 10
            res += v 
            res *= 10
        }
        let value = res / 10 * sym
        if value > Int32.max || value < Int32.min {return 0}
        return value
    }
}
// @lc code=end

