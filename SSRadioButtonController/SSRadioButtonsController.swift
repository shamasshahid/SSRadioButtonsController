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
    override init() {
        
    }
    
    func addButton(aButton:UIButton)
    {
        buttonsArray.append(aButton)
        aButton.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func removeButton(aButton:UIButton)
    {
        var iteration = 0
        var iteratingButton:UIButton? = nil
        for(iteration; iteration<buttonsArray.count;iteration++)
        {
            iteratingButton = buttonsArray[iteration]
            if(iteratingButton == aButton)
            {
                break
            }
            else
            {
                iteratingButton = nil
            }
        }
        if(iteratingButton != nil)
        {
            buttonsArray.removeAtIndex(iteration)
            iteratingButton!.removeTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    func setButtonsArray(aButtonsArray:[UIButton])
    {
        for aButton in aButtonsArray
        {
            aButton.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        buttonsArray = aButtonsArray
    }
    
    func pressed(sender:UIButton)
    {
        if(sender.selected)
        {
            sender.selected = false
        }
        else
        {
            for aButton in buttonsArray
            {
                if aButton != sender
                {
                    aButton.selected = false
                }
            }
            sender.selected = true
        }
    }
    
    func selectedButton() ->UIButton?
    {
        return currentSelectedButton
    }
}