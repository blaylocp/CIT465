//
//  ViewController.swift
//  json
//
//  Created by Preston Blaylock on 10/15/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        

        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        enum JSONError: String, ErrorType {
            case NoData = "ERROR: no data"
            case ConversionFailed = "ERROR: conversion from JSON failed"
            case InvalidJSON = "ERROR: Invalid JSON Object"
        }
        
        
        /***************************************************************
         *  Good Parse Example
         ***************************************************************/
        do{
            let JSONString = "{\"names\": [\"Bob\", \"Tim\"]}"
            let data =  JSONString.dataUsingEncoding(NSUTF8StringEncoding)!

            guard let jsonDATA:AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers) else {throw JSONError.ConversionFailed}
            print(jsonDATA)
        } catch let errorMes as NSError {
            print(errorMes.description)
        }
        
        
        /***************************************************************
        *  Nasty Parse Example
        ***************************************************************/
        do{
            //let JSONString = "{\"names\": [\"Bob\", \"Tim\"]}"
            //let JSONString = "[1,2,3,4]"
            let JSONString = "[1,2,3,4"
            let data =  JSONString.dataUsingEncoding(NSUTF8StringEncoding)!
            
            guard let jsonDATA:AnyObject? = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers) else {throw JSONError.ConversionFailed}
            print(jsonDATA)
        } catch let errorMes as JSONError {
            print(errorMes.rawValue)
        } catch {
            print(error)
        }
        
        /***************************************************************
        *  API Parse Example
        ***************************************************************/
        do{
            let url = NSURL(string: "https://api.github.com/users/mralexgray/repos")
            let data = NSData(contentsOfURL: url!)
            
            guard let jsonData:AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) else {throw JSONError.ConversionFailed}
            print(jsonData)
        } catch {
            print(error)
        }
        
        
        /***************************************************************
        *  Good Stringify Example
        ***************************************************************/
        do{
            let numbers = ["one", "tow", "three"]
            if NSJSONSerialization.isValidJSONObject(numbers) {
                let jsonData = try NSJSONSerialization.dataWithJSONObject(numbers, options: NSJSONWritingOptions(rawValue: 0))
                
                let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
                print(stringJSON)
            }

        } catch let errorMes as JSONError{
           print(errorMes)
        } catch {
            print(error)
        }
        
        
        /***************************************************************
        *  Good Stringify Example (Pretty Print)
        ***************************************************************/
        do{
            let numbers = ["one", "tow", "three"]
            if NSJSONSerialization.isValidJSONObject(numbers) {
                let jsonData = try NSJSONSerialization.dataWithJSONObject(numbers, options:NSJSONWritingOptions.PrettyPrinted)
                let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
                print(stringJSON)
            }
            
        } catch let errorMes as JSONError{
            print(errorMes)
        } catch {
            print(error)
        }
        
        /***************************************************************
        *  Good Stringify Dictionary Example (Pretty Print)
        ***************************************************************/
        do{
            let person = ["Firstname" : "Preston", "Lastname": "Blaylock", "Age": 25]
            if NSJSONSerialization.isValidJSONObject(person) {
                let jsonData = try NSJSONSerialization.dataWithJSONObject(person, options:NSJSONWritingOptions.PrettyPrinted)
                let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
                print(stringJSON)
            }
        } catch let errorMes as JSONError{
            print(errorMes)
        } catch {
            print(error)
        }
        
        
        /***************************************************************
        *  Good Stringify Example Object
        ***************************************************************/
        // Classes are not serilizable JSON Objects
        // https://medium.com/swift-programming/4-json-in-swift-144bf5f88ce4#.n72pu5uce
        // Valid JSON elements are Dictionary, Array, String, Number, Boolean and null
        do{
            print("\n Object Stringfy")
            class Person{
                let firstName: String
                let middleName: String?
                let lastName: String
                
                init(firstName: String, lastName: String, middleName: String?){
                    self.firstName = firstName
                    self.lastName = lastName
                    self.middleName = middleName
                }
            }
            
            
            let preston = Person(firstName: "Preston", lastName: "Blaylock", middleName:  "Scott")
            if NSJSONSerialization.isValidJSONObject(preston) {
                let jsonData = try NSJSONSerialization.dataWithJSONObject(preston, options:NSJSONWritingOptions.PrettyPrinted)
                let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
                print(stringJSON)
            }
        } catch let errorMes as JSONError{
            print(errorMes)
        } catch {
            print(error)
        }
        
        
        /***************************************************************
        *  Good Stringify Example Object with Optional
        ***************************************************************/
        // Classes are not serilizable JSON Objects
        // https://medium.com/swift-programming/4-json-in-swift-144bf5f88ce4#.n72pu5uce
        // Valid JSON elements are Dictionary, Array, String, Number, Boolean and null
        do{
            class Person{
                let firstName: String
                let middleName: String?
                let lastName: String
                
                init(firstName: String, lastName: String, middleName: String?){
                    self.firstName = firstName
                    self.lastName = lastName
                    self.middleName = middleName
                }
            }
            
            
            let preston = Person(firstName: "Preston", lastName: "Blaylock", middleName:  nil)
            if NSJSONSerialization.isValidJSONObject(preston) {
                let jsonData = try NSJSONSerialization.dataWithJSONObject(preston, options:NSJSONWritingOptions.PrettyPrinted)
                let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
                print(stringJSON)
            }
        } catch let errorMes as JSONError{
            print(errorMes)
        } catch {
            print(error)
        }
        
        
        /***************************************************************
        *  Nasty Stringify Example Array of Optionals
        ***************************************************************/
        // This Produces a compile Error
//        do{
//            let numbers: [String?] = ["one", nil, "three"]
//            if NSJSONSerialization.isValidJSONObject(numbers) {
//                let jsonData = try NSJSONSerialization.dataWithJSONObject(numbers, options:NSJSONWritingOptions.PrettyPrinted)
//                let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
//                print(stringJSON)
//            }
//        } catch let errorMes as JSONError{
//            print(errorMes)
//        } catch {
//            print(error)
//        }
        
        /***************************************************************
        *  Nasty Stringify Example Dictionay of Optionals
        ***************************************************************/
        // This Produces a compile Error
//        do{
//            let person2: [String : AnyObject?] = ["FirstName": "Preston", "Lastname" : nil, "Age": 25]
//            if NSJSONSerialization.isValidJSONObject(person2) {
//                let jsonData = try NSJSONSerialization.dataWithJSONObject(person2, options:NSJSONWritingOptions.PrettyPrinted)
//                let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
//                print(stringJSON)
//            }
//        } catch let errorMes as JSONError{
//            print(errorMes)
//        } catch {
//            print(error)
//        }
        

        
        
        /***************************************************************
        *  Nasty Stringify Example Struct
        ***************************************************************/
        // This produces a compile Error, you can't pass a struct
//        do{
//            struct Card {
//                let suit : String
//                let rank : Int
//            }
//            
//            let heartJack = Card(suit: "Hearts", rank: 11)
//            if NSJSONSerialization.isValidJSONObject(heartJack) {
//                let jsonData = try NSJSONSerialization.dataWithJSONObject(heartJack, options:NSJSONWritingOptions.PrettyPrinted)
//                let stringJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
//                print(stringJSON)
//            }
//        } catch let errorMes as JSONError{
//            print(errorMes)
//        } catch {
//            print(error)
//        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

