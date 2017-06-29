//
//  TableViewCell.swift
//  SampleProject
//
//  Created by Abdussamet Özay on 29/06/2017.
//  Copyright © 2017 Al Shamas Tufail. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var btnLabel: SSRadioButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
