//
//  Tutorial.swift
//  MATTest
//
//  Created by Developer Appg on 2020/07/09.
//  Copyright © 2020 appg. All rights reserved.
//

import UIKit
import CoreLocation
class Tutorial: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("before")
        guard let viewControllerIndex = VCArray.index(of: viewController as! TutorialPageVC) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex - 1
        
        guard nextIndex >= 0 else{
            return nil
        }
        
        guard VCArray.count > nextIndex else{
            return nil
        }
        Log("before\(viewControllerIndex)")
        return VCArray[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print("after")
        guard let viewControllerIndex = VCArray.index(of: viewController as! TutorialPageVC) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < VCArray.count else{
            //            return VCArray.first
            return nil
        }
        
        guard VCArray.count > nextIndex else{
            return nil
        }
        Log("after\(viewControllerIndex)")
        return VCArray[nextIndex]
    }
    
    
    
    
   
    @IBOutlet var container: UIView!
    var VCArray : [TutorialPageVC] = [TutorialPageVC(nibName: "TutorialPageVC", bundle: nil),TutorialPageVC(nibName: "TutorialPageVC", bundle: nil)]
    var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
        self.pageViewController.setViewControllers([VCArray[0]], direction: .forward, animated: true, completion: nil)
        self.addChild(self.pageViewController) //자식컨트롤러로 등록
        self.container.addSubview(self.pageViewController.view)//뷰 등록
        self.pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.pageViewController.view.superview?.addConstraint(NSLayoutConstraint(item: self.pageViewController.view, attribute: .leading, relatedBy: .equal, toItem: self.pageViewController.view.superview, attribute: .leading, multiplier: 1.0, constant: 0))
        self.pageViewController.view.superview?.addConstraint(NSLayoutConstraint(item: self.pageViewController.view, attribute: .trailing, relatedBy: .equal, toItem: self.pageViewController.view.superview, attribute: .trailing, multiplier: 1.0, constant: 0))
        self.pageViewController.view.superview?.addConstraint(NSLayoutConstraint(item: self.pageViewController.view, attribute: .top, relatedBy: .equal, toItem: self.pageViewController.view.superview, attribute: .top, multiplier: 1.0, constant: 0))
        self.pageViewController.view.superview?.addConstraint(NSLayoutConstraint(item: self.pageViewController.view, attribute: .bottom, relatedBy: .equal, toItem: self.pageViewController.view.superview, attribute: .bottom, multiplier: 1.0, constant: 0))
        
        //        aa.didMove(toParent: self)
    }
        func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
            print("willTransitionTo")
        }
    //    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
    //        print("spineLocationFor")
    //        return UIPageViewController.SpineLocation(rawValue: <#T##Int#>)
    //    }
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            print("didFinishAnimating")
        }
        
        func presentationCount(for pageViewController: UIPageViewController) -> Int {
            return VCArray.count
        }
        
        func presentationIndex(for pageViewController: UIPageViewController) -> Int {
            return 0
        }
    @IBAction func button(_ sender: UIButton) {

        LocationPermission.shared.requestPermission()
        let loginVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "navi")
        loginVC.modalTransitionStyle = .coverVertical
        self.present(loginVC, animated: true, completion: nil)
        
    }


}
