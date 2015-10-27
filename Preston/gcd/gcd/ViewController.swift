//
//  ViewController.swift
//  gcd
//
//  Created by Preston Blaylock on 10/7/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    
    
    @IBAction func reset(sender: AnyObject) {
        counter.text = "Counter"
        updateLabel.text = "Label"
    }
    
    @IBAction func changeLabel(sender: UIButton) {
        let array = ["Frodo", "sam", "wise", "gamgee"]
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        updateLabel.text = array[randomIndex]
    }

    
    @IBAction func start(sender: UIButton) {
        
        
        /* Bad (This locks up the UI)*/
        /*
        for index in 1...9000000{
            counter.text = "\(index)"
        }
        */
        
        /* This is a working example */
        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {() -> () in
//            
//            var endValue: Int = 0
//            for index in 1...900000000{
//                endValue = index
//                print(index)
//            }
//            dispatch_async(dispatch_get_main_queue(), {
//                    self.counter.text = "\(endValue)"
//            })
//        }) 
        

        
        /* This is also a working example by writing the closure afterwards */
        /*
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {() -> () in
            
            var endValue: Int = 0
            for index in 1...900000000{
                endValue = index
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.counter.text = "\(endValue)"
            }
        } */
        
        
        /* This locks up the UI */
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {() -> () in
//            
//            var endValue: Int = 0
//            for index in 1...50000{
//                endValue = index
//                print(index)
//            }
//            dispatch_sync(dispatch_get_main_queue()) {
//                self.counter.text = "\(endValue)"
//            }
//        }
        
        /* This is an example of sync */
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {() -> () in
//            
//            var endValue: Int = 0
//            for index in 1...20000{
//                endValue = index
//                print(index)
//            }
//            self.updateLabel.text = "sync from UI thread"
//            dispatch_async(dispatch_get_main_queue()) {
//                self.counter.text = "\(endValue)"
//            }
//        }
        
        
        /* This is an example of cross lock */
        
        // The Background thread is waiting on the main thread
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){ () -> () in
//            for index in 1 ... 100 {
//                print(index)
//            }
//            
//            // The Main is waiting for hte background Thread
//            dispatch_sync(dispatch_get_main_queue()){ () -> () in
//                for index2 in 100 ... 200 {
//                    print(index2)
//                }
//            }
//        }
        
        /* This doesn't create cross lock */
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)){ () -> () in
//            for index in 1 ... 100 {
//                print(index)
//            }
//            
//            dispatch_async(dispatch_get_main_queue()) { () -> () in
//                for index2 in 100 ... 200 {
//                    print(index2)
//                }
//            }
//        }
        
        /* This doesn't create cross lock */
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)){ () -> () in
//            
//            for index in 1 ... 100 {
//                print(index)
//            }
//            
//            dispatch_sync(dispatch_get_main_queue()) { () -> () in
//                for index2 in 100 ... 200 {
//                    print(index2)
//                }
//            }
//        }

        
        /* Race Condition */
        class Pumpkin{
            var hasSeeds: Bool
            var seeds: Int = 1000
            
            init(hasSeeds: Bool) {
                self.hasSeeds = hasSeeds
            }
            
            func removeSeeds () {
                print(seeds)
                while hasSeeds == true{
                    if seeds >= 1{
                        seeds--
                    }
                    print(seeds)
                }
                hasSeeds = false
                
            }
        }

        let jack = Pumpkin(hasSeeds: true)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){ () -> () in
            jack.removeSeeds()
            print("\(jack.seeds)")
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){ () -> () in
            jack.hasSeeds = false
        }
        // The seeds never get removed because this sets the value to false so the loop doesn't run 
        
       

        
        //updateLabel.text = "hello from UI thread"
        
        func helloWorld() -> (){
            print("Hello World From the background")
        }
        
        
        /* Simple Example */
//        let queue = NSOperationQueue()
//        queue.addOperationWithBlock(){   // This adds a closure
//            helloWorld()
//        }
        
        /* Another Example */
//        NSOperationQueue().addOperationWithBlock(){
//            helloWorld()
//        }
        
        /* Missing Paranethesis */
//        NSOperationQueue.addOperationWithBlock(){  //Cannot convert value of type '() -> _' to expected argument type
//            helloWorld()
//        }
//        
        /* Updating the UI Thread */
//        NSOperationQueue().addOperationWithBlock(){
//            helloWorld()
//            NSOperationQueue.mainQueue().addOperationWithBlock(){
//                self.updateLabel.text = "Updateing Main Thread"
//            }
//        }

        /* Async or Sync */
        /* This will create a cross lock if it is sync */
//        NSOperationQueue().addOperationWithBlock(){
//            for index in 1...100{
//                print(index)
//            }
//            NSOperationQueue.mainQueue().addOperationWithBlock(){
//                for index2 in 100...200{
//                    print(index2)
//                }
//            }
//        }
        
        
        /* Creating a NSOperation */
        
        class Peep: NSOperation{ // We are inheriting from the abstract NSOperation Class
            var numberOfChickens: Int
            
            init(numberOfChickens: Int){
                self.numberOfChickens = numberOfChickens
            }
            
            func slaughterChickens(numberToCook: Int){
                print("Slaughtering \(numberToCook) chicken")
                numberOfChickens -= numberToCook
            }
        }
        
        
        let aPeep = Peep(numberOfChickens: 10)
        NSOperationQueue().addOperation(aPeep)
        aPeep.completionBlock = {() -> () in
            aPeep.slaughterChickens(3)
            print("There are \(aPeep.numberOfChickens) left")
            NSOperationQueue.mainQueue().addOperationWithBlock(){
                print("Hi from the Main Tread")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

