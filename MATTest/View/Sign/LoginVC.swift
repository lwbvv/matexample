//
//  LoginVC.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/10.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let viewC = Tutorial(nibName: "Tutorial", bundle: nil)
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.pushViewController(viewC, animated: true)
    }
}
