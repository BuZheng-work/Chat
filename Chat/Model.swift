//
//  Moodel.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/7/27.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import Foundation
import UIKit
struct MessageModel {
    
    let msg:String
    let way:MsgWay
    var success:Bool
    
    init(msg:String,way:MsgWay,success:Bool = true) {
        
        self.msg = msg
        self.way = way
        self.success = success
    }
    
}
enum MsgWay{
    
    case send
    case recive
}

protocol MessageType {
    
    var messageLab: UILabel!{get}
    var errorImageView:UIImageView!{get}
}

let iphoneX = UIScreen.instancesRespond(to:#selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width:1125,height:2436), (UIScreen.main.currentMode?.size)!) : false
