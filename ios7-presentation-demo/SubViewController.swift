//
//  SubViewController.swift
//  ios7-presentation-demo
//
//  Created by YangCun on 14/12/27.
//  Copyright (c) 2014年 backslash112. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
