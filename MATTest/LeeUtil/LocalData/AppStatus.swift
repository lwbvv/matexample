//
//  AppStatus.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/13.
//  Copyright © 2020 appg. All rights reserved.
//

import Foundation

class AppStatus{
    static let shared = AppStatus()
    
    var LaunchedBefore : Bool {
        get {
            return userDefault.bool(forKey: Key.UserDefault.launchedBefore)
        }
        set(newValue) {
            userDefault.set(newValue, forKey: Key.UserDefault.launchedBefore)
        }
    }
    
}
