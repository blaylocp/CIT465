//
//  main.swift
//  loops
//
//  Created by Preston Blaylock on 9/29/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import Foundation

/*
 *  For in are like For Each loops
 */

// For in loop
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
print("\tEnd of Loop\n")




// Different Key word
for test in 1...5 {
    print("\(test) times 5 is \(test * 5)")
}
print("\tEnd of Loop\n")





// For In without index
let base = 3
let power = 10
var answer = 1

for _ in 1 ... power {
    answer *= base
}
print("\t\(base) to the power of \(power) is \(answer)\n")




// for in  using an array
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
print("\tEnd of Loop\n")



let names2 = [String]()
for name in names2 {
    print("Hello, \(name)!")
}
print("\tEnd of Loop: Empty Array\n") // Prints out nothing




// for in  using an dictionary
let numberOfFruit = ["apples": 8, "oranges": 6, "kiwis": 4]
for (fruitName, fruitCount) in numberOfFruit {
    print("\(fruitName)s have \(fruitCount) legs")
}
print("\tEnd of Loop\n")




let emptyDictionary = [String:Float]()
for (key, value) in emptyDictionary {
    print("\(key)s have \(value) legs")
}
print("\tEnd of Loop: Empty Dictionary\n") // Prints out nothing




// for in  using an dictionary (Different Datatypes)
let person = ["Name": "preston", "age": 6, "height": 5.6]
for (key, value) in person {
    print("\(key) : \(value)")
}
print("\tEnd of Loop\n")
print(person["Name"])




// Doesn't Work
//for value in "Test"{
//    print(value))
//}



// Doesn't work
//for (key, value) in "Test"{
//    print("\(key) : \(value)")
//}



/*
 *  For loops
 */

