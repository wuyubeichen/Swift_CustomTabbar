//
//  MainTabBarController.swift
//  ZSProject
//
//  Created by Bjmsp on 17/6/26.
//
//

import UIKit

class MainTabBarController: UITabBarController, MainTabBarDelegate{
    
    var tarbarConfigArr:[Dictionary<String,String>]! //标签栏配置数组，从Plist文件中读取
    var mainTabBarView: MainTabBarView! //自定义的底部TabbarView
    
    //MARK: - Life Cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        //1.调用父类的初始化方法
        super.init(nibName: nil, bundle: nil)
        //2.读取Plist文件,初始化标签栏配置数组
        self.tarbarConfigArr = self.getConfigArrFromPlistFile()
        //3.创建视图控制器
        self.createControllers()
        //4.创建自定义TabBarView
        self.createMainTabBarView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    //MARK: - Private Methods
    private  func  getConfigArrFromPlistFile() ->([Dictionary<String,String>]?){
        let  filePath: String? = Bundle.main.path(forResource: "TabBarConfig", ofType: "plist")
        let plistData = NSDictionary(contentsOfFile: filePath ?? "")
        let configArr = plistData?.object(forKey: "Tabbars") as? [Dictionary<String,String>]
        return configArr;
    }
    
    
    //创建视图控制器
    private func createControllers(){
        //初始化视图控制器类名数组
        var controllerNameArray = [String]()
        for dictionary in self.tarbarConfigArr{
            let className:String = dictionary["ClassName"]!
            controllerNameArray.append(className);
            
        guard controllerNameArray.count > 0 else{
            print("error:控制器数组为空")
            return
        }
        //初始化导航控制器数组
        var nvcArray = [BaseNavigationViewController]()
        //在Swift中, 通过字符串创建一个类, 那么必须加上命名空间clsName
        let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        for vcName in controllerNameArray {
            //动态获取的命名空间是不包含.的, 所以需要我们自己手动拼接
            let anyClass: AnyClass? = NSClassFromString(clsName + "." + vcName)
            //将AnyClass类型转换为BaseViewController类型，
            //因为Swift中通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
            if let vcClassType = anyClass as? BaseViewController.Type {
                let viewcontroller = vcClassType.init()
                let nav = BaseNavigationViewController(rootViewController:viewcontroller)
                nvcArray.append(nav)
            }
        }
        //设置标签栏数组
        self.viewControllers = nvcArray
        }
    }

    
    //创建自定义Tabbar
    private func createMainTabBarView(){
        //1.获取系统自带的标签栏视图的frame,并将其设置为隐藏
        let tabBarRect = self.tabBar.frame;
        self.tabBar.isHidden = true;
        //3.使用得到的frame，和plist数据创建自定义标签栏
        mainTabBarView = MainTabBarView(frame: tabBarRect,tabbarConfigArr:tarbarConfigArr!);
        mainTabBarView.delegate = self
        self.view .addSubview(mainTabBarView)
    }
    
    //MARK: - MainTabBarDelegate
    func didChooseItem(itemIndex: Int) {
        self.selectedIndex = itemIndex

    }
}


