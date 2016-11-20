//
//  InviteFriendTableViewCell.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/19.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class InviteFriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var friendsImage: UIImageView!
    @IBOutlet weak var friendsNameLabel: UILabel!
    @IBOutlet weak var addFriendButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
