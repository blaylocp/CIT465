//
//  main.swift
//  SandboxFileIO
//
//  Created by Ritchie Fitzgerald on 11/18/15.
//  Copyright © 2015 fitz. All rights reserved.
//

import Foundation

print("Hello, World!")

/************************************
 * TESTING FILE WRITING FUNCTIONS
 ************************************/

let testArray = ["Ritchie", "Hannah", "Leah", "Andrew"]
var joined = testArray.joinWithSeparator(";;;")
var destinationPath = "/Users/ritchiefitzgerald/Desktop/arrayFile.txt"

// Write to file
do {
    try joined.writeToFile(destinationPath, atomically: true, encoding: NSUTF8StringEncoding)
} catch let error as NSError {
    print("Error: \(error)")
}

// Read from file
do {
    let readFile = try String(contentsOfFile: destinationPath, encoding: NSUTF8StringEncoding)
//  prints Ritchie;;;Hannah;;;Leah;;;Andrew

//  Save back into array
    let newArray = readFile.componentsSeparatedByString(";;;")
//  prints ["Ritchie", "Hannah", "Leah", "Andrew"]
} catch let error as NSError {
    print("Error: \(error)")
}

let testDict = ["name": "Ritchie", "age": "30", "number": "2088811252"]
joined = ""
destinationPath = "/Users/ritchiefitzgerald/Desktop/dictFile.txt"
for (key, value) in testDict {
    joined += "\(key):\(value);;;"
}
joined = String(joined.characters.dropLast(3))

// Write to file
do {
    try joined.writeToFile(destinationPath, atomically: true, encoding: NSUTF8StringEncoding)
} catch let error as NSError {
    print("Error: \(error)")
}

// Read from file
do {
    let readFile = try String(contentsOfFile: destinationPath, encoding: NSUTF8StringEncoding)
    //  prints age:30;;;number:2088811252;;;name:Ritchie
    
    //  Save back into dict
    let pairArray = readFile.componentsSeparatedByString(";;;")
    var newDict = [String:String]()
    for pair in pairArray {
        let keyValue = pair.componentsSeparatedByString(":")
        newDict[keyValue[0]] = keyValue[1]
    }
//  prints ["age": "30", "number": "2088811252", "name": "Ritchie"]
} catch let error as NSError {
    print("Error: \(error)")
}

/********************
 * NASTY PATHS
 ********************/

// Happy Path!
var someText = NSString(string:"some text")
destinationPath = "/Users/ritchiefitzgerald/Desktop/myFile.txt"
var filemgr = NSFileManager.defaultManager()
if filemgr.fileExistsAtPath(destinationPath) {
    print("File exists")
    do {
        let readFile = try String(contentsOfFile: destinationPath, encoding: NSUTF8StringEncoding)
        print("\(readFile)")
    } catch let error as NSError {
        print("Error: \(error)")
    }
} else {
    print("File does not exist")
    do {
        try someText.writeToFile(destinationPath, atomically: true, encoding: NSUTF8StringEncoding)
        print("Wrote to File!")
    } catch let error as NSError {
        print("Error: \(error)")
    }
}

// Nasty Path
// Using an empty string.
// Success still write to the file.
someText = NSString(string:"")
destinationPath = "/Users/ritchiefitzgerald/Desktop/emptyString.txt"
filemgr = NSFileManager.defaultManager()
if filemgr.fileExistsAtPath(destinationPath) {
    print("File exists")
    do {
        let readFile = try String(contentsOfFile: destinationPath, encoding: NSUTF8StringEncoding)
        print("\(readFile)")
    } catch let error as NSError {
        print("Error: \(error)")
    }
} else {
    print("File does not exist")
    do {
        try someText.writeToFile(destinationPath, atomically: true, encoding: NSUTF8StringEncoding)
        print("Wrote to File!")
    } catch let error as NSError {
        print("Error: \(error)")
    }
}

// Nasty Path
// In destination path include everything but the filename.
// ERROR: "The file “Desktop” couldn’t be opened because you don’t have permission to view it."
someText = NSString(string: "no file")
destinationPath = "/Users/ritchiefitzgerald/Desktop/"
filemgr = NSFileManager.defaultManager()
if filemgr.fileExistsAtPath(destinationPath) {
    print("File exists")
    do {
        let readFile = try String(contentsOfFile: destinationPath, encoding: NSUTF8StringEncoding)
        print("\(readFile)")
    } catch let error as NSError {
        print("Error: \(error)")
    }
} else {
    print("File does not exist")
    do {
        try someText.writeToFile(destinationPath, atomically: true, encoding: NSUTF8StringEncoding)
        print("Wrote to File!")
    } catch let error as NSError {
        print("Error: \(error)")
    }
}

// Nasty Path
// Make destination path an empty string.
// ERROR: "The item couldn’t be saved because the file name “” is invalid."
someText = NSString(string: "no filepath at all")
destinationPath = ""
filemgr = NSFileManager.defaultManager()
if filemgr.fileExistsAtPath(destinationPath) {
    print("File exists")
    do {
        let readFile = try String(contentsOfFile: destinationPath, encoding: NSUTF8StringEncoding)
        print("\(readFile)")
    } catch let error as NSError {
        print("Error: \(error)")
    }
} else {
    print("File does not exist")
    do {
        try someText.writeToFile(destinationPath, atomically: true, encoding: NSUTF8StringEncoding)
        print("Wrote to File!")
    } catch let error as NSError {
        print("Error: \(error)")
    }
}

// Nasty Path
// Make destination path equal to nil.
// ERROR: unexpectedly found nil while unwrapping an Optional value
//someText = NSString(string: "no filepath at all")
//var nilDestinationPath:String? = nil
//filemgr = NSFileManager.defaultManager()
//if filemgr.fileExistsAtPath(destinationPath) {
//    print("File exists")
//    do {
//        let readFile = try String(contentsOfFile: nilDestinationPath!, encoding: NSUTF8StringEncoding)
//        print("\(readFile)")
//        // the above prints "some text"
//    } catch let error as NSError {
//        print("Error: \(error)")
//    }
//} else {
//    print("File does not exist")
//    do {
//        try someText.writeToFile(nilDestinationPath!, atomically: true, encoding: NSUTF8StringEncoding)
//        print("Wrote to File!")
//    } catch let error as NSError {
//        print("Error: \(error)")
//    }
//}

// Nasty Path
// Set destination path to a file that we cannot read from.
// ERROR: "The file “cantRead.txt” couldn’t be opened because you don’t have permission to view it."
someText = NSString(string: "no read permission")
destinationPath = "/Users/ritchiefitzgerald/Desktop/cantRead.txt"
filemgr = NSFileManager.defaultManager()
if filemgr.fileExistsAtPath(destinationPath) {
    print("File exists")
    do {
        let readFile = try String(contentsOfFile: destinationPath, encoding: NSUTF8StringEncoding)
        print("\(readFile)")
    } catch let error as NSError {
        print("Error: \(error)")
    }
}

// Nasty Path
// Set destination path to a file that we cannot write to.
// ERROR: This shouldn't work, but it DOES!!!????
someText = NSString(string: "no write permission haha still br. barney")
destinationPath = "/Users/ritchiefitzgerald/Desktop/cantWrite.txt"
filemgr = NSFileManager.defaultManager()
do {
    try someText.writeToFile(destinationPath, atomically: true, encoding: NSUTF8StringEncoding)
    print("Wrote to File!")
} catch let error as NSError {
    print("Error: \(error)")
}