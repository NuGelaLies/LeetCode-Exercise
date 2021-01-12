//
//  GSD.swift
//  LeetCodeSample
//
//  Created by NuGelaliee on 1/5/21.
//

import Foundation

struct GSD {
    
    static let shared = GSD()
    
    private let serialQueue = DispatchQueue(label: "com.nugela.SerialQueue")
    
    private let concurrentQueue = DispatchQueue(label: "con.nugela.concurrentQueue", attributes: .concurrent)
    
    func syncQueue(isConcurrent: Bool = false) {
        let queue = isConcurrent ? concurrentQueue : serialQueue
        queue.sync {
            (0..<5).forEach { print("rool-1 -> \($0): \(Thread.current)") }
        }
        
        queue.sync {
            (0..<5).forEach { print("rool-1 -> \($0): \(Thread.current)") }
        }
    }
    
    func asyncSerialSequence(isConcurrent: Bool = false) {
        let queue = isConcurrent ? concurrentQueue : serialQueue
        print(print("1: \(Thread.current)"))
        queue.async { print("2: \(Thread.current)") }
        print("3: \(Thread.current)")
        queue.async { print("4: \(Thread.current)") }
        print("5: \(Thread.current)")
    }
    
    func asyncQueueSleep(isConcurrent: Bool = false) {
        let queue = isConcurrent ? concurrentQueue : serialQueue
        (0..<50).forEach {
            print("main - \($0)")
            Thread.sleep(forTimeInterval: 0.2)
        }
        
        queue.async {
            
            (0..<5).forEach {
                print("rool-1 -> \($0): \(Thread.current)")
                Thread.sleep(forTimeInterval: 0.2)
            }
            
        }
        
        queue.async {
            
            (0..<5).forEach {
                print("rool-2 -> \($0): \(Thread.current)")
                Thread.sleep(forTimeInterval: 0.2)
            }
        }
    }
    
    func asyncQueueTest2(isConcurrent: Bool = false) {
        let queue = isConcurrent ? concurrentQueue : serialQueue
        // 当前线程执行打印 main-1 的操作
        print("main-1")

        // 线程执行到这里发现遇到一个 async 任务，
        // 那么线程不会等待它执行完成，就会继续执行其他操作。
        //
        // 串行或并发队列
        queue.async {
            (0..<20).forEach { print("async \($0)") }
        }

        // 开辟线程的时间大约是90微妙，加上循环的准备以及打印时间，
        // 这里给它200微妙，测试async任务中的线程和当前线程之间的执行顺序。
        Thread.sleep(forTimeInterval: 0.0002000)

        // 不会等待！线程不会等待 async 执行完成就会执行打印 main-2 的操作
        print("main-2")
    }
    
    func asyncQueueTest3(isConcurrent: Bool = false) {
        let queue = isConcurrent ? concurrentQueue : serialQueue
        queue.sync {
            print("task-1")
            queue.async {
                (0..<10).forEach {
                    print("task-2: \($0) \(Thread.current)")
                    Thread.sleep(forTimeInterval: 0.5)
                }
            }
            print("task-1 - end")
        }
    }
    
    func asyncQueueTest4(isConcurrent: Bool = false) {
        let queue = isConcurrent ? concurrentQueue : serialQueue
        queue.async {
            print("task-1 \(Thread.current)")
            
            queue.async {
                 print("task-2 \(Thread.current)")
            }
            queue.async {
                print("task-3 \(Thread.current)")
            }
            queue.async {
                print("task-4 \(Thread.current)")
            }
            queue.async {
                print("task-5 \(Thread.current)")
            }
            
            print("task-6 \(Thread.current)")
        }
    }
    
    func asyncConcurrentQueue() {
        concurrentQueue.sync {
            print("task-1 \(Thread.current)")
            
            concurrentQueue.sync {
                print("task-2 \(Thread.current)")
            }
            
            concurrentQueue.sync {
                print("task-3 \(Thread.current)")
            }
            
            concurrentQueue.sync {
                print("task-4 \(Thread.current)")
            }
            
            concurrentQueue.sync {
                print("task-5 \(Thread.current)")
            }

            print("task-6 \(Thread.current)")
        }

    }
    
    func asyncConcurrentQueueTest() {
        let queue = concurrentQueue
        queue.sync {
            print("task-1 \(Thread.current)")
            
            queue.sync {
                print("task-2 \(Thread.current)")
            }
            
            queue.sync {
                print("task-3 \(Thread.current)")
            }
            
            queue.sync {
                print("task-4 \(Thread.current)")
            }
            
            queue.sync {
                print("task-5 \(Thread.current)")
            }
            
            print("task-6 \(Thread.current)")
        }
    }
    
    func asyncConcurrentQueueTest1(isConcurrent: Bool = false) {
        let queue = isConcurrent ? concurrentQueue : serialQueue
        queue.async {
            print("task-1 \(Thread.current)")
            
            queue.async {
                print("task-2 \(Thread.current)")
            }
            queue.async {
                print("task-3 \(Thread.current)")
            }
            queue.async {
                print("task-4 \(Thread.current)")
            }
            queue.async {
                print("task-5 \(Thread.current)")
            }
            queue.async {
                print("task-6 \(Thread.current)")
            }
            
            print("task-7 \(Thread.current)")
        }
    }
}
