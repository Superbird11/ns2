//
//  ViewController.swift
//  options-for-uibuttons
//
//  Created by Louis Jacobowitz on 7/20/15.
//  Copyright (c) 2015 Louis Jacobowitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myButton : UIButton!
    //This item is directly linked to the button on the main view, making it so that manipulating this in the code changes that in the UI.
    //To do this with a UI element, it must be tagged as an @IBOutlet.
    var buttonValue = Int(0)

    @IBAction func changeButtonEnabled (sender: UISwitch) {
        //Similarly, an IBAction is a function that can be directly linked to an action on an object on the storyboard. If this function is declared with a parameter, the object that calls it will send itself as that parameter - in this case, the switch that triggers this function will send itself as our sender variable so that we can check whether it's on or not.
        if (sender.on) {
            myButton.enabled = true
        }
        else {
            myButton.enabled = false
        }
    }
    
    @IBAction func changeButtonValue () {
        buttonValue += 1
        let buttonText = "My Value is: " + String(buttonValue)
        myButton.setTitle(buttonText, forState: .Normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Rather than in an init function, we'll be doing most of the setup for our view controller here. You can use an init function, of course, but this is often easier.
        buttonValue = 0;
        myButton.setTitle("This Is a Button", forState: .Normal)
        myButton.setTitle("You're Pressing Me Now", forState: .Highlighted)
        myButton.setTitle("You can't press me", forState: .Disabled)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

