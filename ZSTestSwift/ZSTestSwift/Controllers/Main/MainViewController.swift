//
//  MainViewController.swift
//  ZSTestSwift
//
//  Created by zhoushuai on 2017/7/15.
//  Copyright © 2017年 Zhoushuai. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //作为导航控制器的的根视图控制器不需要父类中的返回按钮
        self.navigationItem.leftBarButtonItem = nil;
        self.view.backgroundColor = UIColor.orange
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
