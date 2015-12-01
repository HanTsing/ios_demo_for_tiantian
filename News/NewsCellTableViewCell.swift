//
//  newsCellTableViewCell.swift
//  News
//
//  Created by hanqing on 11/26/15.
//  Copyright © 2015 hanqing. All rights reserved.
//

import UIKit

class NewsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImag: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
