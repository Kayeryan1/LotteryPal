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
    var goal: String = "0";
    var jackpot: Int? = 100

    @IBOutlet weak var editGoalButton: UIButton!
    @IBOutlet weak var goalConfirmButton: UIButton!
    @IBOutlet weak var goalUpdateField: UITextField!
    @IBOutlet weak var goalExceededLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var jackpotLabel: UILabel!
    

    @IBAction func editGoal(sender: AnyObject) {
        editGoalView.hidden = false;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initially hide editGoalView
        editGoalView.hidden = true
        goalExceededLabel.hidden = true
        goalUpdateField.text=goal
        jackpotLabel.text = "$ " + "\(jackpot!)" + "Million";
        goalLabel.text = "Goal: $" + goal + "mil";
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //when you click the button to confirm your goal
    @IBAction func confirmGoal(sender: AnyObject) {
        editGoalView.hidden=true;
        
        if (goalUpdateField.text != nil){
            goal = goalUpdateField.text!
        }
        if (Int(goal)<=jackpot){
            goalExceededLabel.hidden = false;
        }
        else {
            goalExceededLabel.hidden = true;
        }
        goalLabel.text = "Goal: $" + goal + "mil";
    }

    @IBAction func updateGoal(sender: AnyObject) {
        goalUpdateField.text = ""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }


}

