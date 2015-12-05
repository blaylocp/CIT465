//
//  ViewController.swift
//  GCDNSOperation
//
//  Created by Ritchie Fitzgerald on 11/19/15.
//  Copyright © 2015 fitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var secondCounter: UILabel!
    
    @IBOutlet weak var crossCounter1: UILabel!
    @IBOutlet weak var crossCounter2: UILabel!
    @IBOutlet weak var raceConditionCounter: UILabel!
    
    @IBOutlet weak var nsColorCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func countNow(sender: AnyObject) {
//      Nasty Path
//      Reason: Performing functionality on main thread makes it so user can't do anything else.
        for i in 1...900000 {
            countLabel.text = String(i)
        }
    }

    @IBAction func randomColors(sender: AnyObject) {
//      Happy Path
//      Keeps running in the background and uses minimal calculation in the main thread.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            for i in 1...10 {
                let color = [UIColor.redColor(), UIColor.blueColor(), UIColor.yellowColor(), UIColor.greenColor()]
                let random = Int(arc4random_uniform(4))
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.view.backgroundColor = color[random]
                    self.secondCounter.text = String(i)
                }
                
                sleep(1)
                
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.view.backgroundColor = UIColor.whiteColor()
                self.secondCounter.text = "0"
            }
            
        }
    }
    
    @IBAction func runCrossLock(sender: AnyObject) {
//      Nasty Path
//      Change: I made the call to the main queue dispatch_async
//      Doesn't create cross lock, but still locks screen for a bit.
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)) {
            var endValue = 0
            for index in 1...100 {
                endValue = index
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.crossCounter1.text = String(endValue)
                for index2 in 100...200 {
                    self.crossCounter2.text = String(index2)
                }
            }
        }
        
//      Nasty Path
//      Change: I made the call to the global queue dispatch_async
//      Doesn't create cross lock, but still locks screen for a bit.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)) {
            var endValue = 0
            for index in 100...200 {
                endValue = index
            }
            
            dispatch_sync(dispatch_get_main_queue()) {
                self.crossCounter1.text = String(endValue)
                for index2 in 200...300 {
                    self.crossCounter2.text = String(index2)
                }
            }
        }
        
//      Nasty Path
//      Reason: Crosslock we sync the global and main queue and the main queue is waiting for global to finish.
//      This will lock up screen indefinetly.
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            var endValue = 0
            for index in 1...100 {
                endValue = index
            }
            
            // The Main is waiting for hte background Thread
            dispatch_sync(dispatch_get_main_queue()) {
                self.crossCounter1.text = String(endValue)
                for index2 in 100...200 {
                    self.crossCounter2.text = String(index2)
                }
            }
        }
    }
    
    @IBAction func runRaceCondition(sender: AnyObject) {
        class DaysTill {
            var reachedDay: Bool = false
            var daysTill: Int = 9000000
            
            func countDays() -> Int {
                while reachedDay == false {
                    daysTill -= 1
                    
                    if daysTill == 0 {
                        reachedDay = true
                    }
                }
                
                return daysTill
            }
        }
        
        let santa = DaysTill()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let dayCount = santa.countDays()
            
            dispatch_async(dispatch_get_main_queue()) {
                self.raceConditionCounter.text = String(dayCount)
            }
        }
        
//      Nasty Path
//      Reason: My object is a pass by reference, so this thread and the one above are both accessing the same instance.
//      Before the thread above can finish counting to 0 this tells it that we reached the day.
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            santa.reachedDay = true
        }
    }
    
    @IBAction func runNSChangeColors(sender: AnyObject) {
        //      Happy Path
        //      Keeps running in the background and uses minimal calculation in the main thread.
        NSOperationQueue().addOperationWithBlock() {
            
            for i in 1...10 {
                let color = [UIColor.redColor(), UIColor.blueColor(), UIColor.yellowColor(), UIColor.greenColor()]
                let random = Int(arc4random_uniform(4))
                
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    self.view.backgroundColor = color[random]
                    self.nsColorCounter.text = String(i)
                }
                
                sleep(1)
                
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock() {
                self.view.backgroundColor = UIColor.whiteColor()
                self.nsColorCounter.text = "0"
            }
            
        }
    }
}

