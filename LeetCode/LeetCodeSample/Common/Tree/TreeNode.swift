//
//  TreeNode.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/18/20.
//

import Foundation

class BTreeNode<T: Comparable> {
    
    let val: T
    var leftNode: BTreeNode<T>?
    var rightNode: BTreeNode<T>?
    init(_ val: T) {
        self.val = val
    }
    
}

class MutableTreeNode<T: Comparable> {
    
    let val: T
    var child: [MutableTreeNode]?
    init(_ val: T) {
        self.val = val
        self.child = nil
    }
    
}
