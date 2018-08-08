//
//  ArticleTableController.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/8.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//  文章列表页面

import UIKit

class ArticleTableController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //这种方式的 UIStoryboardSegue 是两个VC 绑定的 需要手动调用 而与按钮 cell 等绑定的是不需要手动调用的
    func articleTagVC(forTag tag:String) {performSegue(withIdentifier: "articleTag", sender: tag)}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ArticleTagController{
    
            vc.title = sender as?String
        }
        
        if let vc = segue.destination as? ArticleDetailController,let row = tableView.indexPathForSelectedRow?.row {
            
            //这里从数据源中取出模型 并赋值给VC
            print("去往详情页面=\(vc)==\(row)")
        }
        
    }
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell

        cell.tagHundler = articleTagVC
        // Configure the cell...

        return cell
    }
    
}
