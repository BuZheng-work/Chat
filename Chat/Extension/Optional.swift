//
//  Optional.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/10.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import Foundation

extension Optional where Wrapped : Collection{
    
    var number:Int{ return self?.count ?? 0}
}
