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
    @objc func didSelectButton(selectedButton: UIButton?, index: Int)
}

class SSRadioButtonsController : NSObject
{
    fileprivate var buttonsArray = [UIButton]()
    fileprivate var modelArray = [SSRadioButtonModel]()
    
    weak var delegate : SSRadioButtonControllerDelegate? = nil
    /**
     Set whether a selected radio button can be deselected or not. Default value is false.
     */
    var shouldLetDeSelect = false
    /**
     Variadic parameter init that accepts UIButtons.
     
     - parameter buttons: Buttons that should behave as Radio Buttons
     */
    public var respectTableView = false;
    
    override init(){ }
    
    init(buttons: UIButton...) {
        super.init()
        for aButton in buttons {
            modelArray.append(SSRadioButtonModel(button: aButton))
            aButton.addTarget(self, action: #selector(SSRadioButtonsController.pressed(_:)), for: UIControlEvents.touchUpInside)
        }
        self.buttonsArray = buttons
    }
    /**
     Add a UIButton to Controller
     
     - parameter button: Add the button to controller.
     */
    func addButton(_ aButton: UIButton) {
        if((aButton.tag == 0 && self.buttonsArray.index(of: aButton) == nil) || aButton.tag > (self.buttonsArray.count-1)){
            buttonsArray.append(aButton)
            modelArray.append(SSRadioButtonModel(button: aButton))
            aButton.addTarget(self, action: #selector(SSRadioButtonsController.pressed(_:)), for: UIControlEvents.touchUpInside)
        }
    }
    /**
     Remove a UIButton from controller.
     
     - parameter button: Button to be removed from controller.
     */
    func removeButton(_ aButton: UIButton) {
        var iteratingButton: UIButton? = nil
        if(buttonsArray.contains(aButton))
        {
            iteratingButton = aButton
        }
        if(iteratingButton != nil) {
            let removeIndex = buttonsArray.index(of: iteratingButton!)
            buttonsArray.remove(at: removeIndex!)
            modelArray.remove(at: removeIndex!)
            
            iteratingButton!.removeTarget(self, action: #selector(SSRadioButtonsController.pressed(_:)), for: UIControlEvents.touchUpInside)
            iteratingButton!.isSelected = false
        }
    }
    /**
     Set an array of UIButons to behave as controller.
     
     - parameter buttonArray: Array of buttons
     */
    func setButtonsArray(_ aButtonsArray: [UIButton]) {
        for aButton in aButtonsArray {
            modelArray.append(SSRadioButtonModel(button: aButton))
            aButton.addTarget(self, action: #selector(SSRadioButtonsController.pressed(_:)), for: UIControlEvents.touchUpInside)
        }
        buttonsArray = aButtonsArray
    }
    
    func pressed(_ sender: UIButton) {
        var currentSelectedButton: UIButton? = nil
        
        let index = (respectTableView) ? sender.tag : self.buttonsArray.index(of: sender)!
        
        if(sender.isSelected) {
            if shouldLetDeSelect {
                sender.isSelected = false
                currentSelectedButton = nil
                modelArray[index].isSelected = false
            }
        } else {
            for aButton in buttonsArray {
                aButton.isSelected = false
            }
            for aModel in modelArray {
                aModel.isSelected = false
            }
            
            sender.isSelected = true
            currentSelectedButton = sender
            modelArray[index].isSelected = true
        }
        
        delegate?.didSelectButton(selectedButton: currentSelectedButton, index: index)
    }
    /**
     Get the currently selected button.
     
     - returns: Currenlty selected button.
     */
    func selectedButton() -> UIButton? {
        guard let index = buttonsArray.index(where: { button in button.isSelected }) else { return nil }
        
        return buttonsArray[index]
    }
    
    func isSelected(index: Int) -> Bool{
        return self.modelArray[index].isSelected
    }
}
