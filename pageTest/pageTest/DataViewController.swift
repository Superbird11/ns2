//
//  DataViewController.swift
//  pageTest
//
//  Created by Louis Jacobowitz on 7/26/15.
//  Copyright (c) 2015 Louis Jacobowitz. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: AnyObject?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let obj: AnyObject = dataObject {
            self.dataLabel!.text = obj.description
            let myRand1: CGFloat = CGFloat(drand48())
            let myRand2: CGFloat = CGFloat(drand48())
            let myRand3: CGFloat = CGFloat(drand48())
            self.view.backgroundColor = UIColor(red: myRand1, green: myRand2, blue: myRand3, alpha: 1)
        } else {
            self.dataLabel!.text = ""
        }
    }


}

