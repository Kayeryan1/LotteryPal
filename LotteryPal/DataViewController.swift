//
//  DataViewController.swift
//  LotteryPal
//
//  Created by Ryan Kaye on 1/22/16.
//  Copyright © 2016 KWhite. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var editGoalView: UIView!
    @IBOutlet weak var dataLabel: UILabel!
    
    var dataObject: String = ""

    @IBOutlet weak var editGoalButton: UIButton!

    @IBAction func editGoal(sender: AnyObject) {
        editGoalView.hidden = false;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initially hide editGoalView
        editGoalView.hidden = true;
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel!.text = dataObject
    }


}

