//
//  DataStructureTest.swift
//  DataStructureTest
//
//  Created by NuGelaliee on 12/15/20.
//

import XCTest
@testable import LeetCodeSample

class DataStructureTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBinaryTree() throws {
        let node = BTreeNode<Int>(23)
        XCTAssertNotNil(node)
        XCTAssertEqual(node.val, 23)
        XCTAssertNil(node.leftNode)
        XCTAssertNil(node.rightNode)
    }
    
    func testMutiTree() throws {
        let node = MutableTreeNode<Int>(23)
        XCTAssertNotNil(node)
        XCTAssertNil(node.child)
        let items = [2,4,5,6,7].map(MutableTreeNode.init)
        node.child = items
        XCTAssertEqual(node.child?[0].val, 2)
        XCTAssertEqual(node.child?[1].val, 4)
        XCTAssertEqual(node.child?[2].val, 5)
        XCTAssertEqual(node.child?[3].val, 6)
        XCTAssertEqual(node.child?[4].val, 7)
    }
    
    func testLinkedNode() throws {
        let node = LinkedNode<Int>(2)
        let node1 = LinkedNode<Int>(4)
        let node2 = LinkedNode<Int>(2)
        XCTAssertNotNil(node)
        XCTAssert(node2 < node1)
        XCTAssert(node == node2)
    }
    
    func testMergeLinkedNode() throws {
        //let node = LinkedNode<Int>(2)
    }
    
    func testQueue() throws {
        let queue = LCQueue<Int>()
        queue.enqueue(1)
        XCTAssert(!queue.isEmpty)
        queue.enqueue(2)
        XCTAssertEqual(queue.front, 1)
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.front, 2)
    }
    
    func testStack() throws {
        let stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        
        XCTAssert(!stack.isEmpty)
        XCTAssert(stack.count == 2)
        XCTAssert(stack.pop() == 2)
        XCTAssert(stack.pop() == 1)
        XCTAssert(stack.isEmpty)
    }

     
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
