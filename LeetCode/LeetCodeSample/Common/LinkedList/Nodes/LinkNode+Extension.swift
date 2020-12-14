//
//  LinkNode+Extension.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

extension LinkedNode {
    //MARK: - merge two linkedlist
    public func merge<T: Comparable>(lhs: LinkedNode<T>?, rhs: LinkedNode<T>?) -> LinkedNode<T>? {
        guard let lhs = lhs else {
            return rhs
        }
        guard let rhs = rhs else {
            return lhs
        }
        if lhs.val < rhs.val {
            lhs.next = merge(lhs: lhs.next, rhs: rhs)
            return lhs
        }
        rhs.next = merge(lhs: lhs, rhs: rhs.next)
        return rhs
        
    }
}
