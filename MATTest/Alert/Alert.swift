//
//  Alert.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/10.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit



func basicAlert (controller: UIViewController,title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//    let aaa = UIAlertController(nibName: <#T##String?#>, bundle: <#T##Bundle?#>)
    let success = UIAlertAction(title: "확인", style: .default, handler: {action in
        Log("success")
        let tutorialVC = Tutorial(nibName: "Tutorial", bundle: nil)
        tutorialVC.modalTransitionStyle = .coverVertical
        controller.present(tutorialVC, animated: true, completion: nil)
        
    })
    let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    alert.addAction(success)
    alert.addAction(cancel)
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
