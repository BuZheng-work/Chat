//
//  TagItem.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/8/8.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import UIKit

class TagItem: UICollectionViewCell {
    
    @IBOutlet weak var textLable: UILabel!
    
    
    // 计算文字宽高调整item大小
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        
        let width = CGSize(width: CGFloat(MAXFLOAT), height:CGFloat(MAXFLOAT)).width
        
        let size = textLable.sizeThatFits(CGSize(width: width, height: 13))
        
        attributes.size.width =  size.width
        
        return attributes
    
    }
}
