//
//  ViewController.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/09.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit
import CoreLocation
class IntroVC: UIViewController, PermissionAlertDelegate {
    let tutorialVC = Tutorial(nibName: "Tutorial", bundle: nil)
    func moveTutorial() {
        let tutorialVC = Tutorial(nibName: "Tutorial", bundle: nil)
        
        let transition = CATransition()
        transition.duration = 1
        transition.type = CATransitionType.fade
        self.view.layer.add(transition, forKey: nil)
//        tutorialVC.view.frame = self.view.bounds
//        self.view.addSubview(tutorialVC.view)
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(tutorialVC, animated: false)
    }
//    func navigatorPushTutorial() -> () {
//        self.navigationController?.view.layer.add(transition, forKey: nil)
//        self.navigationController?.pushViewController(tutorialVC, animated: false)
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !NetworkStatus.checkDeviceNetworkStatus(){
            netWorkStatusAlert(controller: self, handler: {
                
                      let transition = CATransition()
                        transition.duration = 1
                        transition.type = CATransitionType.fade
    UIApplication.shared.windows.first?.rootViewController?.view.layer.add(transition, forKey: nil)
                UIApplication.shared.windows.first?.rootViewController = self.tutorialVC
                
            })
        }else {
                   let transition = CATransition()
                    transition.duration = 3
                    transition.type = CATransitionType.fade
            guard let window = UIApplication.shared.windows.first else {
                return
            }

            
            //뷰컨트롤러 교체 애니매이션
            // Set the new rootViewController of the window.
            // Calling "UIView.transition" below will animate the swap.
            if AppStatus.shared.LaunchedBefore {
                window.rootViewController = self.tutorialVC

                           // A mask of options indicating how you want to perform the animations.
                           let options: UIView.AnimationOptions = .transitionCrossDissolve

                           // The duration of the transition animation, measured in seconds.
                           let duration: TimeInterval = 3

                           // Creates a transition animation.
                           // Though `animations` is optional, the documentation tells us that it must not be nil. ¯\_(ツ)_/¯
                           UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:nil)
            }else {
                // A mask of options indicating how you want to perform the animations.
                                        let options: UIView.AnimationOptions = .transitionCrossDissolve

                                        // The duration of the transition animation, measured in seconds.
                                        let duration: TimeInterval = 3

                                        // Creates a transition animation.
                                        // Though `animations` is optional, the documentation tells us that it must not be nil. ¯\_(ツ)_/¯
                                        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:nil)
            }
        }
        

//            LocationPermission.shared.requestPermission()
//        Log("위치권한 \(LocationPermission.shared.currentAuthorization)")
//        AppStatus.shared.LaunchedBefore = false
//        if AppStatus.shared.LaunchedBefore {
//            self.alertView.isHidden = true
//        }else {
//            Log("초기실행")
//            self.alertView.isHidden = false
//            self.view.backgroundColor = .gray
            
//        }

    }
 
//    @IBAction func button(_ sender: UIButton) {
////        print(Permission.locationCheck())
//        let locationManager = CLLocationManager.init()
//        locationManager.requestWhenInUseAuthorization()
//    }
}


//바로 화면을 나가버리는 함수
//        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
