
//
//  ChatApi.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/6.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import Foundation
import Moya


let provider = MoyaProvider<ChatApi>()

enum ChatApi {
    case load(email:String,pwass:String)
    case register(email:String,nickName:String,pwass:String)
}
extension ChatApi : TargetType{
    
    var baseURL: URL {return URL(string: "http://localhost:8080")! }
    
    var path: String {
        
        switch self {
        case .load:
            return "user/load"
        case .register:
            return "user/register"
        }
    }
    
    var method: Moya.Method {return .get}
    
    var sampleData: Data {return Data()}
    
    var task: Task {
        switch self {
        case let .load(email, pwass):
            return .requestParameters(parameters: ["email":email,"pwassWord":pwass], encoding: URLEncoding.default)
        case let .register(email, nickName, pwass):
            return .requestParameters(parameters: ["email":email,"nickName":nickName,"pwassWord":pwass], encoding: URLEncoding.default)
    
        }
    }
    
    var headers: [String : String]? {return nil}
    
    
    
}
