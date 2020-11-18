//
//  main.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

example(title: "LinkedList merge two list") {
    
    let left = LinkedList<Int>()
    let right = LinkedList<Int>()
    left.appends(1,2,4,4,6,7,8)
    right.appends(1,3,4,4,5,6,71)
    
    let list = algo.merge(lhs: left, rhs: right)

    print(list.debugDescription)
}

example(title: "Two Sum") {
    let items = [2, 7, 11, 15]
    
    let indexs = algo.twoSum(9, elements: items)
    
    print(indexs)
}

example(title: "Linked Node Add Two Sum") {
    
}
