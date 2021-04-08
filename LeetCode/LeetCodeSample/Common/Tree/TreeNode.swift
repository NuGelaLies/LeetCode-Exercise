//
//  TreeNode.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/18/20.
//

import Foundation

class BTreeNode<T: Comparable> {
    
    let val: T
    var left: BTreeNode<T>?
    var right: BTreeNode<T>?
    init(_ val: T) {
        self.val = val
    }
    
}

class LinkedBinaryTree<T: Comparable> {
    let val: T
    var left: LinkedBinaryTree<T>?
    var right: LinkedBinaryTree<T>?
    var next: LinkedBinaryTree<T>?
    init(_ val: T) {
        self.val = val
    }
}

class MutableTreeNode<T: Comparable> {
    
    let val: T
    var child: [MutableTreeNode]?
    init(_ val: T) {
        self.val = val
    }
    
}
