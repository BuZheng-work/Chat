//
//  ChatService.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/7.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//
import Moya
import Foundation
struct ChatService {
    
   static func service<T:Codable>(of target:ChatApi,successHundler:@escaping (JsonTemplate<T>)->Void,errorHundler:@escaping (String)->Void,failureHundler:@escaping (Error)->Void){
        
        provider.request(target) { (result) in
            
            switch result{
                
            case let .success(respond):
                
                do{
                    
                    let template = try JSONDecoder().decode(JsonTemplate<T>.self, from: respond.data)
                    successHundler(template)
                    
                }catch{
                    
                    errorHundler("解析异常")
                }
            
            case let .failure(error):
                failureHundler(error)
            }
        }
        
        
    }
}
