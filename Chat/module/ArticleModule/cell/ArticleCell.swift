//
//  ArticleCell.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/8.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var nickNameLable: UILabel!
    @IBOutlet weak var contextLable: UILabel!
    
    @IBOutlet weak var headerImageView: UIImageView!{
        
        didSet{
            
            headerImageView.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.userTapGesture))
            headerImageView.addGestureRecognizer(tap)
        }
    }
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!{
        
        didSet{
            
            flowLayout.estimatedItemSize = CGSize(width: 10, height: 13)
        }
    }
    
    var tagDataSources:[String]?{
        didSet{
            
            flowLayout.collectionView?.reloadData()
        }
    }
    
    
    var tagHundler:((String)->Void)?
    var tapHundler:((UITableViewCell)->Void)?
    
    //添加关注
    @IBAction func attentionClick(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
    }
    
    @objc func userTapGesture(sender:UITapGestureRecognizer)  {
        
        tapHundler?(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ArticleCell : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return tagDataSources.number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item =  collectionView.dequeueReusableCell(withReuseIdentifier: "tagItem", for: indexPath) as!TagItem
        item.textLable.text = tagDataSources![indexPath.row]
        return item
    }
}
extension ArticleCell : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let tagName = tagDataSources?[indexPath.row] { tagHundler?("#" + tagName)}
  
    }
}
