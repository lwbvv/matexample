//
//  TutorialPageVC.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/13.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit

protocol TutorialPageVCDelegate {
    
}

class TutorialPageVC: UIViewController {

    @IBOutlet var text: UILabel!
    @IBOutlet var image: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
