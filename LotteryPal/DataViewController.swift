//
//  DataViewController.swift
//  LotteryPal
//
//  Created by Ryan Kaye on 1/22/16.
//  Copyright © 2016 KWhite. All rights reserved.
//

import UIKit
import SystemConfiguration
import Foundation

class DataViewController: UIViewController {

    @IBOutlet weak var editGoalView: UIView!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var editGoalButton: UIButton!
    @IBOutlet weak var goalConfirmButton: UIButton!
    @IBOutlet weak var goalUpdateField: UITextField!
    @IBOutlet weak var goalExceededLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var jackpotLabel: UILabel!
    
    var dataObject: String = ""
    var jackpotString: String = ""
    var powerballString: NSString = ""
    var goal: NSString = "0";
    var jackpot: Int? = 100
    
    @IBAction func editGoal(sender: AnyObject) {
        editGoalView.hidden = false;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        
        // initially hide editGoalView
        editGoalView.hidden = true
        goalExceededLabel.hidden = true
        
        // Check to see if user has ever changed goal
        if defaults.objectForKey("goal") != nil {
            goal = defaults.objectForKey("goal") as! NSString
        }
        
        // Initially set goalUpdateField to current goal
        goalUpdateField.text = goal as String
        
        // Set goalLabel to current goal
        goalLabel.text = "Goal: $" + (goal as String) + "mil";
        
        // Check for internet connection
        if (Reachability.isConnectedToNetwork()) {
            let url = NSURL(string: "http://www.powerball.com")
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                self.powerballString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
                if (self.powerballString != "") {
                    let tempRange = self.powerballString.rangeOfString("$")
                    let tempRange2 = self.powerballString.rangeOfString("&")
                    let newRange = NSMakeRange(tempRange.location.successor(), tempRange2.location.predecessor() - tempRange.location)
                    self.jackpotString = self.powerballString.substringWithRange(newRange)
                    self.jackpot = Int(self.jackpotString)
                    print(self.jackpotString)
                }
                
                self.jackpotLabel.text = "$ " + self.jackpotString + "Million";
            }
            
            print("Got string")
            
            task.resume()
        }
        
    }
    
    //when you click the button to confirm your goal
    @IBAction func confirmGoal(sender: AnyObject) {
        editGoalView.hidden=true;
        
        if (goalUpdateField.text != nil){
            goal = goalUpdateField.text!
        }
        if (Int(goal as String)<=jackpot){
            goalExceededLabel.hidden = false;
        }
        else {
            goalExceededLabel.hidden = true;
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(goal, forKey: "goal")
        goalLabel.text = "Goal: $" + (goal as String) + "mil";
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

