//
//  PermissionAlert.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/13.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit
import RxCocoa
import RxRelay
import RxSwift

protocol PermissionAlertDelegate {
    func moveTutorial() -> ()
}

class PermissionAlert: UIView {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    let name = "PermissionAlert"
    let disposeBag = DisposeBag()
    
    var delegate : PermissionAlertDelegate?
    
    @IBOutlet var successButton: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initView()
    }
    
    func initView() -> () {
         guard let bundle = Bundle.main.loadNibNamed(name, owner: self, options: nil) else { fatalError("\(type(of: self)) is nil") }
         guard let view = bundle.first as? UIView else { return }
         view.frame = self.bounds
        self.addSubview(view)
        buttonAction()
     }
    
    func buttonAction() -> () {
        successButton.rx.tap.bind(onNext: { [weak self] in
            self?.action()
            
            }).disposed(by: disposeBag)
    }
    
    func action() -> () {
//        AppStatus.shared.LaunchedBefore = true
        delegate?.moveTutorial()
        Log("초기실행")
        
    }

}
