//
//  ArticleModel.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/10.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import Foundation
//文章标签model
struct Tag:Codable{
    
    let articleCount:Int
    let id:Int
    let tagName:String
    var tags:[String]{return tagName.components(separatedBy: ",")}
}
//文章内容model
struct ContentModel:Codable {
    
   let context:String
   let id:Int
   let imageUrl:String
}
//文章需要显示的元素model
struct ArticleModel:Codable{
    let author:UserModel
    let article:ContentModel
    let tags:Tag?
}
