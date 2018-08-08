//
//  ChatNavigationController.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/7.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//  自定义导航

import UIKit

final class ChatNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置backItem 的文字
        navigationBar.topItem?.title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
extension UIColor{
    
    /**16进制转换RGB*/
    open class func hexRGB(_ rgbValue:Int) ->UIColor {
        let r = CGFloat((rgbValue & 0xffffff) >> 16)/255.0
        let g = CGFloat((rgbValue & 0xFF00) >> 8)/255.0
        let b = CGFloat(rgbValue & 0xFF)/255.0
        return  UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
}
