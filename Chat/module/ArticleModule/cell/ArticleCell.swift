//
//  ArticleCell.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/8.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var nickNameLable: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var contextLable: UIView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!{
        
        didSet{
            
            flowLayout.estimatedItemSize = CGSize(width: 10, height: 13)
        }
    }
    
    private lazy var tagDataSources:[String] = {
        return ["#","沙滩","比基尼","海"]
    }()
    
    var tagHundler:((String)->Void)?
    
    //添加关注
    @IBAction func attentionClick(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
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
     
        return tagDataSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item =  collectionView.dequeueReusableCell(withReuseIdentifier: "tagItem", for: indexPath) as!TagItem
        item.textLable.text = tagDataSources[indexPath.row]
        return item
    }
}
extension ArticleCell : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("选择了标签==\(tagDataSources[indexPath.row])")
        tagHundler?("#" + tagDataSources[indexPath.row])
        
//
        
    }
}
