//
//  ViewController.swift
//  inputOutputExample
//
//  Created by Richard on 10/15/15.
//  Copyright © 2015 RichardHenke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var favoriteColor: UITextField!
    @IBOutlet weak var labelDisplay: UILabel!
    
    class PeopleInfo {
        var fName: String
        var lName: String
        var favColor: String
        // Constructor
        init () {
            self.fName = ""
            self.lName = ""
            self.favColor = ""
        }
        // Constructor
        init (fName: String, lName: String, favColor: String) {
            self.fName = fName
            self.lName = lName
            self.favColor = favColor
        }
        func toString() -> String {
            return "\(fName), \(lName), \(favColor)"
        }
    }
    
    let file = "file.txt" // The file we will write to
    // Take a look at NSDictionary and NSArray
    // Read to File
    
    var people = Array<String>()
    @IBAction func readFile(sender: AnyObject) {
        labelDisplay.text = "Reading File..."
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first { // .first returns first element or nill
            let path = dir.stringByAppendingPathComponent(file);
            // Output string to label
            var output = ""
            //reading
            if (NSArray(contentsOfFile: path) != nil) {
                let test = NSArray(contentsOfFile: path)
                
                for i in test! {
                    output += (i as! String) + "\n"
                }
                labelDisplay.text! = output
            } else {
                labelDisplay.text = "Opps! There was an error reading the file."
            }
        }
    }
    
    // Write to File
    @IBAction func writeFile(sender: AnyObject) {
        labelDisplay.text = "Writing File..."
        people.append(PeopleInfo(fName: firstName.text!, lName: lastName.text!, favColor: favoriteColor.text!).toString())
        print("How many people are there? \(people.count)")
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first { // .first returns first element or nill
            let path = dir.stringByAppendingPathComponent(file);
            
            //writing
            
            if (people as NSArray).writeToFile(path, atomically: false) {
                print("File written!")
            } else {
                print("Could not write to file.")
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

