//
//  BeautyTableViewCell.swift
//  GitLearn
//
//  Created by Qingke on 16/4/6.
//  Copyright © 2016年 Qingke. All rights reserved.
//

import UIKit

class BeautyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingView: RatingView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
