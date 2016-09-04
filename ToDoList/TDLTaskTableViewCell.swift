//
//  TDLTaskTableViewCell.swift
//  ToDoList
//
//  Created by Andrew Lauer Barinov on 8/27/16.
//  Copyright © 2016 Shuo Yao and Andrew Lauer Barinov. All rights reserved.
//

import UIKit

class TDLTaskTableViewCell: UITableViewCell {
    @IBOutlet var taskDescriptionLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
