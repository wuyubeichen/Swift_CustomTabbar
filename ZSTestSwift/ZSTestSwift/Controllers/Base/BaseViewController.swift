//
//  BaseViewController.swift
//  ZSProject
//
//  Created by zhoushuai on 17/6/26.
//
//

import UIKit
class BaseViewController: UIViewController{
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置视图控制器默认背景色
        self.view.backgroundColor = UIColor.lightGray
        //自定义导航栏按钮
        let leftBtn = UIButton(frame:CGRect(x: 0, y: 0, width: 20, height: 20))
        leftBtn.setImage(UIImage(named:"backIcon"), for: UIControlState.normal)
        leftBtn.addTarget(self, action: #selector(doBackAction(btn:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    //MARK: - Event Response
    func doBackAction(btn:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
