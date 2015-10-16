//
//  RadioButtonsController.swift
//  TestApp
//
//  Created by Al Shamas Tufail on 24/03/2015.
//  Copyright (c) 2015 Al Shamas Tufail. All rights reserved.
//

import Foundation
import UIKit

/// RadioButtonControllerDelegate. Delegate optionally implements didSelectButton that receives selected button.
@objc protocol SSRadioButtonControllerDelegate {
    /**
        This function is called when a button is selected. If 'shouldLetDeSelect' is true, and a button is deselected, this function
    is called with a nil.
    
    */
    optional func didSelectButton(aButton: UIButton?)
}

class SSRadioButtonsController : NSObject
{
    private var buttonsArray = [UIButton]()
    private weak var currentSelectedButton:UIButton? = nil
    weak var delegate : SSRadioButtonControllerDelegate? = nil
    /**
        Set whether a selected radio button can be deselected or not. Default value is false.
    */
    var shouldLetDeSelect = false
    /**
        Variadic parameter init that accepts UIButtons.

        - parameter buttons: Buttons that should behave as Radio Buttons
    */
    init(buttons: UIButton...) {
        super.init()
        for aButton in buttons {
            aButton.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        self.buttonsArray = buttons
    }
    /**
        Add a UIButton to Controller

        - parameter button: Add the button to controller.
    */
    func addButton(aButton: UIButton) {
        buttonsArray.append(aButton)
        aButton.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    /** 
        Remove a UIButton from controller.

        - parameter button: Button to be removed from controller.
    */
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
    /**
        Set an array of UIButons to behave as controller.
        
        - parameter buttonArray: Array of buttons
    */
    func setButtonsArray(aButtonsArray: [UIButton]) {
        for aButton in aButtonsArray {
            aButton.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        buttonsArray = aButtonsArray
    }

    func pressed(sender: UIButton) {
        if(sender.selected) {
            if shouldLetDeSelect {
                sender.selected = false
                currentSelectedButton = nil
            }
        } else {
            for aButton in buttonsArray {
                aButton.selected = false
            }
            sender.selected = true
            currentSelectedButton = sender
        }
        delegate?.didSelectButton?(currentSelectedButton)
    }
    /**
        Get the currently selected button.
    
        - returns: Currenlty selected button.
    */
    func selectedButton() -> UIButton? {
        return currentSelectedButton
    }
}