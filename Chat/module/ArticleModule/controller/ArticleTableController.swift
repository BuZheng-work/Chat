//
//  ArticleTableController.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/8.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//  文章列表页面

import UIKit
import Kingfisher
class ArticleTableController: UITableViewController {


    var dataSources:[ArticleModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articleWorkItem()
    }

    func articleWorkItem() {
        
        ChatService.send(of: .articles, successHundler: { (tempale:JsonTemplate<[ArticleModel]>) in
            
            print("==\(tempale)")
            self.dataSources = tempale.data
            self.tableView.reloadData()
            
        },
        errorHundler: { (message) in
            
            print("error=\(message)")
        },
        failureHundler: { (error) in
            
            print("==\(error.localizedDescription)")
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //这种方式的 UIStoryboardSegue 是两个VC 绑定的 需要手动调用 而与按钮 cell 等绑定的是不需要手动调用的
    func articleTagVC(forTag tag:String) {performSegue(withIdentifier: "TAG_SID", sender: tag)}
    
    func userInfoVC(forGesture cell:UITableViewCell) {
    
        if let index = tableView.indexPath(for: cell) {
            
            performSegue(withIdentifier: "AUTHOR_INFO_SID", sender: dataSources?[index.row].author)
        }
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ArticleTagController{
    
            vc.title = sender as?String
        }
        
        if let vc = segue.destination as? ArticleDetailController,let row = tableView.indexPathForSelectedRow?.row {
            //这里从数据源中取出模型 并赋值给VC
            print("去往详情页面=\(vc)==\(row)")
        }
        
        if let vc = segue.destination as? AuthorController,let author = sender as?UserModel{
            
            vc.title = author.nickName
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return dataSources.number
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell

        cell.tagHundler = articleTagVC
        cell.tapHundler = userInfoVC
        let article = dataSources![indexPath.row]
        
        cell.nickNameLable.text = article.author.nickName
        cell.contextLable.text = article.article.context
        cell.contentImageView.kf.setImage(with: URL(string: article.article.imageUrl))
        cell.tagDataSources = article.tags?.tags
        return cell
    }
}


