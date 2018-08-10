//
//  UserController.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/10.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import UIKit

class UserController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func userTapGesture(_ sender: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: "AUTHOR_INFO_SID", sender: nil)
    }
}
