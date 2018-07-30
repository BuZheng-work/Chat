//
//  BubbleCell.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/7/27.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import UIKit

class ReadCell: UITableViewCell {

    @IBOutlet weak var errorImageView: UIImageView!
    @IBOutlet weak var messageLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ReadCell : MessageType{}
