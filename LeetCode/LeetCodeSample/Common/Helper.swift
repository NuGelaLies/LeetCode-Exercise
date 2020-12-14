//
//  Helper.swift
//  LeetCodeSample
//
//  Created by NuGelaLies on 11/13/20.
//

import Foundation

func example(title: String, _ export: (() -> Void)) {
    print("\n------------- \(title) Start -------------\n")
    export()
    print("\n------------- \(title) End ---------------\n")
}
