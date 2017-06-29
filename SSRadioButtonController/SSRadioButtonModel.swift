//
//  SSRadioButtonModel.swift
//  EPubSDK_iOS
//
//  Created by Abdussamet Özay on 28/06/2017.
//

import UIKit

class SSRadioButtonModel: NSObject {
    public var isSelected = false
    var button : UIButton
    
    init(button: UIButton, selected isSelected: Bool = false) {
        self.isSelected = isSelected;
        self.button = button
    }
}
