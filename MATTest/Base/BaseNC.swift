//
//  BaseNC.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/10.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit

class BaseNC: UINavigationController, UIGestureRecognizerDelegate//스와이프로 화면 팝을 하기 위해 델리게이트 구현
{
    
    var autoRotate = false
    var orientationMask = UIInterfaceOrientationMask.portrait
    var isSwipePop = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactivePopGestureRecognizer?.delegate = self
        self.isNavigationBarHidden = true
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = self.isSwipePop
    }
    
    
    //화면 회전 불가능하게 막음
    override var shouldAutorotate: Bool {
        return self.autoRotate
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return orientationMask
    }
    
    //화면별로 방향을 다르게 하고 싶을 경우
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return (self.topViewController?.supportedInterfaceOrientations)!
//    }
}
