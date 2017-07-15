//
//  BaseNavigationViewController.swift
//  ZSProject
//
//  Created by Bjmsp on 17/6/26.
//
//

import UIKit

class BaseNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
        //设置导航栏的样式
        self.navigationBar.isTranslucent = false
        self.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black, NSFontAttributeName:UIFont.systemFont(ofSize: 18)]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


//实现手势代理，解决重新自定义导航栏左侧按钮，导致系统自带侧滑手势不可用问题
extension BaseNavigationViewController:UIGestureRecognizerDelegate{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.childViewControllers.count == 1 {
            return false
        }
        return true
    }

}
