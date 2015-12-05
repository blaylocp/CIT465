//
//  ViewController.swift
//  GCD-NSOperation
//
//  Created by Richard on 11/26/15.
//  Copyright © 2015 RichardHenke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var foregroundLabel: UILabel!
    @IBOutlet weak var backgroundLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // --- Nasty Path: Slow because it's running on the main thread and locking the UI temporarily
    @IBAction func startForeground(sender: AnyObject) {
        dispatch_async(dispatch_get_main_queue()) {
            for index in 1...5 {
                self.foregroundLabel.text! = "Hello World: \(index)"
            }
            sleep(1)
            
            dispatch_async(dispatch_get_main_queue()) {
                for index in 1...10 {
                    self.foregroundLabel.text! = "Hello (inside) World: \(index)"
                }
                sleep(1)
            }
        }
    }

    // ---- Happy Path: run count in background to free up UI
    @IBAction func startBackground(sender: AnyObject) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            for index in 1...3 {
                dispatch_async(dispatch_get_main_queue()) {
                    self.backgroundLabel.text! = "Hello (background) World: \(index)"
                }
                sleep(1)
            }
            
            let backgroundColors = [UIColor.purpleColor(), UIColor.orangeColor(), UIColor.redColor()]
            for i in 0...2 {
                dispatch_async(dispatch_get_main_queue()) {
                    self.backgroundLabel.text! = String(i)
                    self.backgroundLabel.backgroundColor = backgroundColors[i]
                }
                sleep(1)
            }
        }
    }
    
    
    
    
    
    // --- Nasty Path: Creates a cross lock because the main queue is waiting for the global queue to finish before it starts.
    @IBAction func crossLock(sender: AnyObject) {
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            dispatch_sync(dispatch_get_main_queue()) {
                let backgroundColors = [UIColor.purpleColor(), UIColor.orangeColor(), UIColor.redColor()]
                for i in 0...2 {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.backgroundLabel.text! = String(i)
                        self.backgroundLabel.backgroundColor = backgroundColors[i]
                    }
                }
            }
        }
    } // End of Nasty Path: Cross lock
    
    // --- Nasty Path: Race condition. I set one of my calls to the global queue as a HIGH priority and changed the balance of the banck account since class instinces access the same refferences in memory it messed up my automatic withdraws.
    @IBAction func raceCondition(sender: AnyObject) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            class BankAccount {
                var balance = 100
                var bankrupt = false
                
                func withdraw(amount: Int) -> (Int, String) {
                    if amount < self.balance {
                        self.balance -= amount
                    }
                    if balance < 0 {
                        return (balance, "You are bankrupt!")
                    }
                    return (balance, "You are not bankrupt")
                }
                func deposit(amount: Int) {
                    self.balance += amount
                }
                func viewBalance() -> String {
                    return "Your balance is: \(self.balance)"
                }
            }
            
            let account1 = BankAccount()
            
            dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                var count = 100
                while count > 0 {
                    account1.withdraw(1)
                    count--
                }
                dispatch_async(dispatch_get_main_queue()) {
                    self.foregroundLabel.text = "\(account1.withdraw(1))"
                }
            }
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
                account1.balance = -550
            }
        }
    } // END of Nasty Path: Race condition
    
    
    // ============ NSOperation ================
    
    // --- Hapy Path: Normal execution of NSOperation
    @IBAction func runNSOperation(sender: AnyObject) {
        NSOperationQueue().addOperationWithBlock() {
            for index in 1...3 {
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    self.backgroundLabel.text! = "Hello (background) World: \(index)"
                }
                sleep(1)
            }
            
            let backgroundColors = [UIColor.purpleColor(), UIColor.orangeColor(), UIColor.redColor()]
            for i in 0...2 {
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    self.backgroundLabel.text! = String(i)
                    self.backgroundLabel.backgroundColor = backgroundColors[i]
                }
                sleep(1)
            }
        }
    }
    
    
    
    
    
    
}

