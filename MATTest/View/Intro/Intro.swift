//
//  ViewController.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/09.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit
import CoreLocation
class IntroVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if LocationPermission.shared.isDetermined {
            basicAlert(controller: self, title: "권한 선택을 하였으므로 선택하지 못 합니다", message: "못함")
        }else{
            LocationPermission.shared.requestPermission()
        }
        Log("위치권한 \(LocationPermission.shared.currentAuthorization)")
//        print("")
    }

    @IBAction func button(_ sender: UIButton) {
//        print(Permission.locationCheck())
        let locationManager = CLLocationManager.init()
        locationManager.requestWhenInUseAuthorization()
    }
}


//바로 화면을 나가버리는 함수
//        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
