//
//  ViewController.swift
//  LeetCodeSample
//
//  Created by NuGelaliee on 12/14/20.
//

import UIKit

class ViewController: UIViewController {
   
    let algo = Algo()
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  method.syncSerial()
        
       // asyncConcurrentqueueSample2()

        let s = "bbbbbbb"
        let r = algo.lengthest(s)
        
        print("s == \(r)")
       
    }
 
}

