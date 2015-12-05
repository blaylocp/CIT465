//
//  main.swift
//  SandBoxJSON
//
//  Created by Ritchie Fitzgerald on 11/19/15.
//  Copyright © 2015 fitz. All rights reserved.
//

import Foundation

/********************************
 * PARSE Paths
 ********************************/

// Happy Path
do{
    let JSONString = "{\"names\": [\"Ritchie\", \"Hannah\"]}"
    let data =  JSONString.dataUsingEncoding(NSUTF8StringEncoding)!
    
    let jsonDATA = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
    print(jsonDATA)
} catch let errorMes as NSError {
    print(errorMes.description)
}

// Nasty Path
// Change: I removed the curly brace at the end.
// Error: "Unexpected end of file while parsing object."
do{
    let JSONString = "{\"names\": [\"Ritchie\", \"Hannah\"]"
    let data =  JSONString.dataUsingEncoding(NSUTF8StringEncoding)!
    
    let jsonDATA = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
    print(jsonDATA)
} catch let errorMes as NSError {
    print(errorMes.description)
}

// Nasty Path
// Change: I removed the comma between Ritchie and Hannah.
// Error: "Badly formed array around character 21."
do{
    let JSONString = "{\"names\": [\"Ritchie\" \"Hannah\"]}"
    let data =  JSONString.dataUsingEncoding(NSUTF8StringEncoding)!
    
    let jsonDATA = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
    print(jsonDATA)
} catch let errorMes as NSError {
    print(errorMes.description)
}

// Nasty Path
// Change: I removed the comma between Ritchie and Hannah.
// Error: "No value for key in object around character 9."
do{
    let JSONString = "{\"names\" [\"Ritchie\", \"Hannah\"]}"
    let data =  JSONString.dataUsingEncoding(NSUTF8StringEncoding)!
    
    let jsonDATA = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
    print(jsonDATA)
} catch let errorMes as NSError {
    print(errorMes.description)
}

// Nasty Path
// Change: I removed everything between curly braces.
// Error: No error just an empty JSON object.
do{
    let JSONString = "{}"
    let data =  JSONString.dataUsingEncoding(NSUTF8StringEncoding)!
    
    let jsonDATA = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
    print(jsonDATA)
} catch let errorMes as NSError {
    print(errorMes.description)
}

// Nasty Path
// Change: I passed an empty string.
// Error: "No value."
do{
    let JSONString = ""
    let data =  JSONString.dataUsingEncoding(NSUTF8StringEncoding)!
    
    let jsonDATA = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
    print(jsonDATA)
} catch let errorMes as NSError {
    print(errorMes.description)
}

// Nasty Path
// Change: I passed a nil value.
// Error: unexpectedly found nil while unwrapping an Optional value
// Don't uncomment!!!!!!!!!!!!!
//do{
//    let JSONString:String? = nil
//    let data =  JSONString!.dataUsingEncoding(NSUTF8StringEncoding)!
//    
//    let jsonDATA = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
//    print(jsonDATA)
//} catch let errorMes as NSError {
//    print(errorMes.description)
//}

// Happy Path Urls
do{
    let url = NSURL(string: "https://api.github.com/users/mralexgray/repos")
    let data = NSData(contentsOfURL: url!)
    
    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
    print(jsonData)
//  Type: __NSArrayM
} catch {
    print(error)
}

// Happy Path
// I used an http address rather than an https.
// ERROR: It actually works with http (I thought someone said it didn't).
do{
    let url = NSURL(string: "http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=8rync8vtt4fnnvkag4bhygxw&q=Toy+Story+3&page_limit=1")
    let data = NSData(contentsOfURL: url!)
    
    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
    print(jsonData)
    //  Type: __NSArrayM
} catch {
    print(error)
}

// Nasty Path
// I changed it to a non-valid address (removed last s).
// ERROR: unexpectedly found nil while unwrapping an Optional value
// Don't uncomment!!!!!!!!!!!!!!!!!!!!!
//do{
//    let url = NSURL(string: "https://api.github.com/users/mralexgray/repo")
//    let data = NSData(contentsOfURL: url!)
//    
//    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
//    print(jsonData)
//    print("Type: \(jsonData.dynamicType)")
//    //  __NSArrayM
//} catch {
//    print(error)
//}

// Nasty Path
// I made the URL a blank string.
// ERROR: unexpectedly found nil while unwrapping an Optional value
// Don't uncomment!!!!!!!!!!!!!!!!!!!!!
//do{
//    let url = NSURL(string: "")
//    let data = NSData(contentsOfURL: url!)
//
//    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
//    print(jsonData)
//    print("Type: \(jsonData.dynamicType)")
//    //  __NSArrayM
//} catch {
//    print(error)
//}

/********************************
* STRINGIFY Paths
********************************/

// Happy Path
// Stringified an array.
do{
    let numbers = ["Apple", "Banana", "Orange"]
    if NSJSONSerialization.isValidJSONObject(numbers) {
        let jsonData = try NSJSONSerialization.dataWithJSONObject(numbers, options: .PrettyPrinted)
        let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
        
        print(stringJSON!)
    }
    
} catch {
    print(error)
}

// Happy Path
// Stringified a dictionary.
do{
    let person = ["FirstName" : "Ritchie", "LastName": "Fitzgerald", "Age": 24]
    if NSJSONSerialization.isValidJSONObject(person) {
        let jsonData = try NSJSONSerialization.dataWithJSONObject(person, options: .PrettyPrinted)
        let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
        
        print(stringJSON!)
    }
} catch {
    print(error)
}

// Happy Path
// Stringify an object by calling its to dictionary function.
class Person {
    let firstName: String
    let middleName: String
    let lastName: String
    
    init(firstName: String, lastName: String, middleName: String){
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
    }
    
    func toDictionary() -> [String:String] {
        return ["firstName": firstName, "lastName": lastName, "middleName": middleName]
    }
}

do{
    let ritchie = Person(firstName: "Ritchie", lastName: "Fitzgerald", middleName:  "Kimball")
    if NSJSONSerialization.isValidJSONObject(ritchie.toDictionary()) {
        let jsonData = try NSJSONSerialization.dataWithJSONObject(ritchie.toDictionary(), options: .PrettyPrinted)
        let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
        print(stringJSON!)
    }
} catch {
    print("It didn't work!")
}

// Nasty Path
// I tried to stringify a string, but it doesn't work.
// ERROR: (it didn't throw an error.)
do{
    let ritchie = Person(firstName: "Ritchie", lastName: "Fitzgerald", middleName:  "Kimball")
    if NSJSONSerialization.isValidJSONObject(ritchie) {
        let jsonData = try NSJSONSerialization.dataWithJSONObject(ritchie, options: .PrettyPrinted)
        let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
        print(stringJSON!)
    }
} catch {
    print("It didn't work!")
}

// Nasty Paths
// All other Stringify nasty paths caused complier errors.



