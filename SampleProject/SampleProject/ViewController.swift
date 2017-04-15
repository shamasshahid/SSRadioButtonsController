//
//  ViewController.swift
//  SampleProject
//
//  Created by Al Shamas Tufail on 27/03/2015.
//  Copyright (c) 2015 Al Shamas Tufail. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SSRadioButtonControllerDelegate {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!

    var radioButtonController: SSRadioButtonsController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radioButtonController = SSRadioButtonsController(buttons: button1, button2, button3)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true

        // Do any additional setup after loading the view, typically from a nib.
    }

    func didSelectButton(selectedButton: UIButton?)
    {
        NSLog(" \(selectedButton)" )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

