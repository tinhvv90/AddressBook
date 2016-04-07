//
//  CustomTableViewCell.swift
//  AddressBook
//
//  Created by Tinh on 3/7/16.
//  Copyright © 2016 Seven. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
// MARK: properties
    @IBOutlet weak var AvatarImg: UIImageView!
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var phoneLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
