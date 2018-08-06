//
//  JsonTemplate.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/6.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import Foundation
struct JsonTemplate<T:Codable>:Codable {
    
    let data:T
    let statue:resultCode

}
struct resultCode:Codable {
    let message:String
    let code:Int
}
