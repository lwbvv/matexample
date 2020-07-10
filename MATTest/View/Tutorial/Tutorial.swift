//
//  Tutorial.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/09.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit
import CoreLocation
class Tutorial: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let locationManager = CLLocationManager()
//         locationManager.requestWhenInUseAuthorization()
    }


    @IBAction func button(_ sender: UIButton) {
//        basicAlert(controller: self, title: "될까?", message: "돼라")
        LocationPermission.shared.requestPermission()
        
        let loginVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "navi")
        loginVC.modalTransitionStyle = .coverVertical
        self.present(loginVC, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
