//
//  MyTableViewCell.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/4.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var goalImageView: UIImageView!
    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var restNum: UILabel!
    @IBOutlet weak var memberNum: UILabel!
    @IBOutlet weak var continNum: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
