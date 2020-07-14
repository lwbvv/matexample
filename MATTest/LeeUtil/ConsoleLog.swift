//
//  ConsoleLog.swift
//  oqupie
//
//  Created by Developer Appg on 2020/06/25.
//  Copyright © 2020 swany. All rights reserved.
//

import Foundation

public func Log<T>(_ object: T?, filename: String = #file, line: Int = #line, funcName: String = #function){
    #if DEBUG
    let th = Thread.current.isMainThread ? "main": Thread.current.name ?? "-"
    if let obj = object {
        print("***** \(Date()) \(th) \(filename.components(separatedBy: "/").last ?? "") (LINE\(line)) :: \(funcName) :: \(obj)")
        
    } else{
        print("***** \(Date()) \(th) \(filename.components(separatedBy: "/").last ?? "") (LINE\(line)) :: \(funcName) :: nil")
        
    }
    #endif

}


