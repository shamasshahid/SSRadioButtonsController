//
//  RadioButtonsController.swift
//  TestApp
//
//  Created by Al Shamas Tufail on 24/03/2015.
//  Copyright (c) 2015 Al Shamas Tufail. All rights reserved.
//

import Foundation
import UIKit
class SSRadioButtonsController :NSObject
{
    private var buttonsArray = [UIButton]()
    private weak var currentSelectedButton:UIButton? = nil

    init(buttons: UIButton...) {
        super.init()
        for aButton in buttons {
            aButton.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        self.buttonsArray = buttons
    }

    func addButton(aButton: UIButton) {
        buttonsArray.append(aButton)
        aButton.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
    }

    func removeButton(aButton: UIButton) {
        var iteration = 0
        var iteratingButton: UIButton? = nil
        for( ; iteration<buttonsArray.count; iteration++) {
            iteratingButton = buttonsArray[iteration]
            if(iteratingButton == aButton) {
                break
            } else {
                iteratingButton = nil
            }
        }
        if(iteratingButton != nil) {
            buttonsArray.removeAtIndex(iteration)
            iteratingButton!.removeTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
            if currentSelectedButton == iteratingButton {
                currentSelectedButton = nil
            }
        }
    }

    func setButtonsArray(aButtonsArray: [UIButton]) {
        for aButton in aButtonsArray {
            aButton.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        buttonsArray = aButtonsArray
    }

    func pressed(sender: UIButton) {
        if(sender.selected) {
            sender.selected = false
            currentSelectedButton = nil
        } else {
            for aButton in buttonsArray {
                aButton.selected = false
            }
            sender.selected = true
            currentSelectedButton = sender
        }
    }

    func selectedButton() -> UIButton? {
        return currentSelectedButton
    }
}