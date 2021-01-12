//
//  ViewController.swift
//  LeetCodeSample
//
//  Created by NuGelaliee on 12/14/20.
//

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  method.syncSerial()
        
       // asyncConcurrentqueueSample2()
    }
    
    func asyncSerialQueueSample1() {
        let queue = DispatchQueue(label: "com.nugelalies.SerialQueue")
        print("Task start - \(Thread.current)")
        queue.async {
            print("T1 - \(Thread.current)")
        }

        queue.async {
            print("T2 - \(Thread.current)")
        }

        queue.async {
            print("T3 - \(Thread.current)")
        }

        print("Task end - \(Thread.current)")

    }
    
    func asyncConcurrentqueueSample2() {
        let queue = DispatchQueue(label: "com.nugelalies.ConcurrentQueue", attributes: .concurrent)
        
        queue.async {
            print("t1 - \(Thread.current)")
        }
        queue.async {
            print("t2 - \(Thread.current)")
        }
        
        queue.sync {
            print("t3 - \(Thread.current)")
        }
        
        print("t0 - \(Thread.current)")
        
        queue.async {
            print("t4 - \(Thread.current)")
        }
        
        queue.async {
            print("t5 - \(Thread.current)")
        }
        
        queue.async {
            print("t6 - \(Thread.current)")
        }
        
        print("t7 - \(Thread.current)")
        
    }
    
    
}

