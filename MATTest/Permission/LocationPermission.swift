//
//  Permission.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/09.
//  Copyright © 2020 appg. All rights reserved.
//

import Foundation
import CoreLocation

class LocationPermission : NSObject, CLLocationManagerDelegate {
    static let shared = LocationPermission.init()
    private let locationManager = CLLocationManager.init()

    
    private let notDetermined : Int32 = 0 //권한 선택 안함
    private let restricted : Int32 = 1 //위치 서비스 사용 권한 없음
    private let denied : Int32 = 2 //권한 거부했거나 설정에서 비활설화
    private let authorizedAlways : Int32 = 3 //언제든지 사용
    private let authorizedWhenInUse : Int32 = 4 //사용하는 동안에만 권한 부여
    var currentAuthorization : Int32 {return CLLocationManager.authorizationStatus().rawValue} //권한 확인

    var isDetermined : Bool {
        get {
            return currentAuthorization != notDetermined //현재 권한 선택 상태가 미선택이 아닐시에는 true
        }
    }
    
    //로케이션 권한이 있는지 체크
    var isActivateLocation : Bool {
        get {
            //위치권한을 항상 받거나 or 앱이 켜져 있을 때 받으면 true
            return self.currentAuthorization == self.authorizedAlways || self.currentAuthorization == self.authorizedWhenInUse
        }
        
    }
    
    
    func requestPermission() -> () {
        Log("위치권한 \(isActivateLocation)")
        Log("\(CLLocationManager.authorizationStatus().rawValue)")
        
        if !isActivateLocation {
        locationManager.requestAlwaysAuthorization()
        }
        
    }
    
    
   
}
