//
//  MainTabBarItem.swift
//  ZSProject
//
//  Created by zhoushuai on 17/6/26.
//
//

import UIKit

class MainTabBarItem: UIControl {
    var itemDic:Dictionary<String, String>
    let imgView: UIImageView
    let titleLabel: UILabel
    
    //属性观察器
    var currentSelectState = false {
        didSet{
            if currentSelectState {
                //被选中
                imgView.image = UIImage(named:itemDic["SelectedImg"]!)
                titleLabel.textColor = UIColor.red
            }else{
                //没被选中
                imgView.image = UIImage(named: itemDic["NormalImg"]!)
                titleLabel.textColor = UIColor.lightGray
            }
        }
    }
    
    init(frame:CGRect, itemDic:Dictionary<String, String>, itemIndex:Int) {
        self.itemDic = itemDic
        
        //布局使用的参数
        let defaulutLabelH:CGFloat = 20.0 //文字的高度
        var imgTop:CGFloat = 3
        var imgWidth:CGFloat = 25
        //中间的按钮的布局参数做特殊处理
        if itemIndex == 1{
            imgTop = -20
            imgWidth = 50
        }
        let imgLeft:CGFloat = (frame.size.width - imgWidth)/2
        let imgHeight:CGFloat  = frame.size.height - defaulutLabelH - imgTop
        //图片
        imgView = UIImageView(frame: CGRect(x: imgLeft, y: imgTop, width:imgWidth, height:imgHeight))
        imgView.image = UIImage(named: itemDic["NormalImg"]!)
        imgView.contentMode = UIViewContentMode.scaleAspectFit
        //title
        titleLabel = UILabel(frame:CGRect(x: 0, y: frame.height - defaulutLabelH, width: frame.size.width, height: defaulutLabelH))
        titleLabel.text = itemDic["Title"]!
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.systemFont(ofSize: 11)
        titleLabel.textColor = UIColor.lightGray
        
        super.init(frame: frame)
        self.addSubview(imgView)
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
