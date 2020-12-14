//
//  LinkedList+Extensions.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

extension LinkedList {
    public func appends(_ values: T...) {
        values.forEach(append)
    }
}

extension LinkedList {
    
    public func reverse() {
        var node = head
        while let next = node {
            node = next.next
            swap(&next.previous, &next.next)
            head = next
        }
    }
}


