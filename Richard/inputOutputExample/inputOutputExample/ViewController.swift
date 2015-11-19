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
        
        init (stringObject: String) {
            var peopleProperties = stringObject.componentsSeparatedByString(",")
            self.fName = peopleProperties[0]
            self.lName = peopleProperties[1]
            self.favColor = peopleProperties[2]
        }
        
        func toString() -> String {
            return "\(fName), \(lName), \(favColor)"
        }
    }
     // ================ Heppy Path: Correct file type
    let file = "file.txt" // The file we will write to
    // ================ Nasty Path: File with different file type than .txt Error: This will not read into file. When you try to write with NSArray's writeToFile() it will overwrite anything already in the file.
    // let file = "picture.png"
    
    
    // Bro. Barney's Suggestions: Take a look at NSDictionary and NSArray
    
    // Read to File
    var people = Array<String>()
    @IBAction func readFile(sender: AnyObject) {
       
        // ================ Happy Path: Reading a perfectly good .txt file  =====================
        labelDisplay.text = "Reading File..."
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first { // .first returns first element or nill
            let path = dir.stringByAppendingPathComponent(file);
            // Output string to label
            var output = ""
            //reading
            if (NSArray(contentsOfFile: path) != nil) {
                let test = NSArray(contentsOfFile: path)
                
                for i in test! {
                    // Outputs to a label in the UI
                    output += (i as! String) + "\n"
                    // Prints out the object type PeopleInfo and prints it out using it's toSting() property
                    print(PeopleInfo(stringObject: i as! String).toString())
                }
                labelDisplay.text! = output
            } else {
                labelDisplay.text = "Opps! There was an error reading the file."
            }
        }
        
        // ================ START Nasty Path: Reading trying to read in a file that doesn't exist  =====================
        //  NSArray contentsOfFile returns An array initialized to contain the contents of the file specified by aPath or nil if the file can’t be opened or the contents of the file can’t be parsed into an array.
        
//        labelDisplay.text = "Reading File..."
//        let fileDoesNotExist = "file.png"
//        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first { // .first returns first element or nill
//            let path = dir.stringByAppendingPathComponent(fileDoesNotExist);
//            // Output string to label
//            var output = ""
//            //reading
//            if (NSArray(contentsOfFile: path) != nil) {
//                let test = NSArray(contentsOfFile: path)
//                
//                for i in test! {
//                    // Outputs to a label in the UI
//                    output += (i as! String) + "\n"
//                    // Prints out the object type PeopleInfo and prints it out using it's toSting() property
//                    print(PeopleInfo(stringObject: i as! String).toString())
//                }
//                labelDisplay.text! = output
//            } else {
//                labelDisplay.text = "Opps! There was an error reading the file."
//            }
//        }
        // ================ END Nasty Path: Reading trying to read in a file that doesn't exist  =====================
        
    } // End of function
    
    // Write to File
    @IBAction func writeFile(sender: AnyObject) {
        labelDisplay.text = "Writing File..."
        // Creates the object type PeopleInfo and returns a string using it's toSting() property and appends to an array
        people.append(PeopleInfo(fName: firstName.text!, lName: lastName.text!, favColor: favoriteColor.text!).toString())
        print("How many people are there? \(people.count)")
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first { // .first returns first element or nill
            let path = dir.stringByAppendingPathComponent(file);
            
            //Converts a swift Array to an NSArray to use the writeToFile automatacally property for easy Output
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

