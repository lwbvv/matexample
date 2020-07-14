//
//  Alert.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/10.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit


//네트워크 상태 확인하는 알럿 함수
func netWorkStatusAlert (controller: UIViewController, handler : (() -> ())?) {
    Log("Func netWorkStatusAlert")
    let alert = UIAlertController(title: "네트워크", message: "네트워크 상태를 확인해 주세요", preferredStyle: .alert)
    let success = UIAlertAction(title: "다시시도", style: .default, handler: {action in
        if !NetworkStatus.checkDeviceNetworkStatus(){
            netWorkStatusAlert(controller: controller, handler: nil)
        }else {
            if let action = handler { action() }
        }
        alert.dismiss(animated: true, completion: nil)
        
    })
    alert.addAction(success)
    controller.present(alert, animated: true, completion: nil)
}

func basicAlert (controller: UIViewController , title: String, message: String, handler: (() -> ())? ) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let success = UIAlertAction(title: "확인", style: .default, handler: {action in
        Log("success")
        if let block = handler { block() }
        alert.dismiss(animated: true, completion: nil)
    })
    
    let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    alert.addAction(success)
    alert.addAction(cancel)
    controller.present(alert, animated: true, completion: nil)
}

func customAlert (_ nibName: String, controller: UIViewController) {
    let alert = UIAlertController(nibName: nibName, bundle: nil)
    controller.present(alert, animated: true, completion: nil)
    
}


//알럿 높이 조정
//let alertController = UIAlertController(title: nil, message: "hello", preferredStyle: .alert)
//
//
//   let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
//       // hide action sheet
//   }
//   alertController.addAction(cancelAction)
//
//
//   var height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.height * 0.80)
//   alertController.view.addConstraint(height);
//   self.present(alertController, animated: true, completion: nil)
