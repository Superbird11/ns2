//
//  FirstViewController.swift
//  ThreeTabsProgram
//
//  Created by Louis Jacobowitz on 7/11/15.
//  Copyright (c) 2015 Louis Jacobowitz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!
    //we need to use ! to tell the compiler that these WILL exist; no ambiguity involved.

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white:1.0, alpha: 1.0)
        
        //for convenience in positioning
        let myWidth = self.view.frame.width
        let myHeight = self.view.frame.height
        
        nameLabel = UILabel()
        nameLabel.text = "First View"
        nameLabel.font = UIFont(name: "Helvetica", size: 36)
        nameLabel.textAlignment = .Center
        nameLabel.frame = CGRectMake(1,1, 210, 42)
        nameLabel.center = CGPointMake(myWidth / 2, myHeight / 2)
        self.view.addSubview(nameLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "Managed by FirstViewController"
        descriptionLabel.font = UIFont.systemFontOfSize(14.0)
        descriptionLabel.textAlignment = .Center
        descriptionLabel.frame = CGRectMake(1,1,236,17)
        descriptionLabel.center = CGPointMake(myWidth / 2, nameLabel.center.y + nameLabel.frame.height/2 + 8)
        self.view.addSubview(descriptionLabel)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
