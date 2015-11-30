//
//  main.swift
//  ExtendProtocolSubscript
//
//  Created by Ritchie Fitzgerald on 11/17/15.
//  Copyright © 2015 fitz. All rights reserved.
//

import Foundation

print("Hello, World!")

/* EXTENSIONS */
extension String {
    mutating func translateToSpanish() -> String {
        let translatedPhrase:String
        
        switch self {
            case "Hello":
                translatedPhrase = "Hola"
            case "How are you?":
                translatedPhrase = "¿Como estás?"
            case "Goodbye":
                translatedPhrase = "¡Adíos!"
            default:
                print("Could not be translated!")
                translatedPhrase = self
        }
        
        return translatedPhrase
    }
}

var testString = "Hello"
print(testString.translateToSpanish())
testString = "How are you?"
print(testString.translateToSpanish())
testString = "Goodbye"
print(testString.translateToSpanish())

extension Int {
    var asText: String {
        return String(self)
    }
    
    mutating func containsDigit(digit: Int) -> Bool {
        
        if digit > 9 || digit < 0 {
            return false
        }
        
        let asString = String(self)
        let digitAsChar = Character(String(digit))
        
        if asString.characters.contains(digitAsChar) {
            return true
        }
        
        return false
    }
}

var testInt = 10
print("\nValue: \(testInt) \nType: \(testInt.dynamicType)")
var testIntString = testInt.asText
print("\nValue: \(testIntString) \nType: \(testIntString.dynamicType)")

print("Contains 1: \(testInt.containsDigit(1))")
print("Contains 3: \(testInt.containsDigit(3))")
print("Contains 19: \(testInt.containsDigit(19))")

/* PROTOCOLS */

protocol SomeProtocol {
    var aString: String {get}
    init(aParameter: String)
}

// Made it required so now subclasses have to implement it as well.
class SomeClass: SomeProtocol {
    var aString: String
    required init(aParameter: String) {
        self.aString = aParameter
    }
}

// The sub class had to implement it.
class ChildSomeClass: SomeClass {
    var anotherString: String
    required init(aParameter: String) {
        self.anotherString = aParameter
        super.init(aParameter: aParameter)
    }
}

protocol ACHandler {
    func handleIt(data: Dictionary<String, AnyObject>) -> Void
}

class LoginHandler: ACHandler {
    var users = [["username": "Jason", "password": "blah1"], ["username": "Ritchie", "password": "blah2"], ["username": "Chris", "password": "blah3"]]
    func handleIt(data: Dictionary<String, AnyObject>) {
        let username = data["username"] as! String
        let password = data["password"] as! String
        
        for user in self.users {
            if user["username"] == username && user["password"] == password {
                print("Logged In!")
            }
        }
        
        print("Login Failed!")
    }
}

class LogoutHandler: ACHandler {
    var users = [["username": "Jason", "password": "blah1"], ["username": "Ritchie", "password": "blah2"], ["username": "Chris", "password": "blah3"]]
    func handleIt(data: Dictionary<String, AnyObject>) {
        let username = data["username"] as! String
        print("\(username) logged out!")
    }
}

// Can use the same protocols on structs and classes
struct DisplayGreeting: ACHandler {
    func handleIt(data: Dictionary<String, AnyObject>) {
        print("Hello \(data["username"] as! String)")
    }
}

/* SUBSCRIPTS */
extension Int {
//  returns first occurance of digit
    subscript(digitIndex: Int) -> Int? {
        let asString = String(self)
        let digitAsChar = Character(String(digitIndex))
        var count = 0
        for c in asString.characters {
            if c == digitAsChar {
                return count
            }
            count += 1
        }
        
        return nil
    }
}

print(12345[1]!)
print(12345[6])

extension String {
    subscript (index: Int) -> Character? {
        var count = 0
        for c in self.characters {
            if count == index {
                return c
            }
            count += 1
        }
        return nil
    }
}

print("Hello")
print("Position 1: \("Hello"[1]!)")
print("Position 2: \("Hello"[2]!)")
print("Position 3: \("Hello"[3]!)")
print("Position 5: \("Hello"[5])")
