//
//  LoadController.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/7/30.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//  登录注册页面

import UIKit

class LoadController: UIViewController {

    @IBOutlet weak var pwassTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        emailTF.text = "726616682@qq.com"
        pwassTF.text = "123456"
        #endif
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //发起网络请求
    func loadService(_ finish:@escaping (Bool)->Void) {
        
        guard let email = emailTF.text,let pwass = pwassTF.text else {return}
        
        provider.request(.load(email: email, pwass: pwass)) { (result) in
            
            switch result{
            case let .success(respond):
                
                do{
                   let model = try JSONDecoder().decode(JsonTemplate<UserModel>.self, from: respond.data)
                   
                    UserManager.share.user =  model.data
                    finish(true)
                    
                }catch{
                    
                    print("==\(error.localizedDescription)")
                }
            
            case let .failure(error):
                print("==\(error.localizedDescription)")
            }
        }

    }
 
}
//自定义Segue
class LoadCustomSegue: UIStoryboardSegue {
    
    override func perform() {
        
        let loadVC = source as!LoadController
        loadVC.loadService { (result) in
            
//            guard result == true else {return}
            UIApplication.shared.keyWindow?.rootViewController = self.destination
        }
        
    }
    
}
