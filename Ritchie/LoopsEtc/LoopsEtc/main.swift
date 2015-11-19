//
//  main.swift
//  LoopsEtc
//
//  Created by Ritchie Fitzgerald on 9/29/15.
//  Copyright (c) 2015 App Fish. All rights reserved.
//

import Foundation

/************** VARIABLES ***************/
// Can change value after intial setup.

/* Numbers */

// Auto detects the correct type for numbers
// Swift.Int
var anInt = 34
// Swift.Double
var aDouble = 34.0

// Calculates how far away another Int is.
// 6
anInt.distanceTo(40)

// 6.5
aDouble.distanceTo(40.5)

// The methods do not change the current value.
// It always returns the results.

// anInt equal to 34

anInt.advancedBy(6)
// returns 40
// anInt is still equal to 34
var advanced = anInt.advancedBy(6)
// advanced is equal to 40.



/* Strings */

var aString = "abcdefg"

// Methods don't require ()
// Same as Int and Double doesn't change the current value.
// returns new value
aString.capitalizedString
// returns "Abcdefg"
// aString still is equal to abcdefg

aString.uppercaseString
// returns "ABCDEFG"

let range = aString.rangeOfString("cde")
// returns Optional(Range(2..<5))

// Removes in place.
aString.removeRange(range!)
// aString now equals abfg

/************** LET ***************/
// Cannot change value after intial.
// Works much faster than "var" though.

// Can change
var aVarName = "Ritchie"
aVarName = "Preston"

// Can't change
let aLetName = "Ritchie"
// This doesn't work.
// aLetName = "Preston"

/************** LOOPS ***************/

/* For Loops */

// Old and slow way.
// Don't use this way.
for var i = 1; i < 16; i++ {
    if (i % 5 == 0) {
        print(i)
    }
    else {
        print("\(i) ", terminator: "")
    }
}
// 1 2 3 4 5
// 6 7 8 9 10
// 11 12 13 14 15

// Build array with 15 characters. Then loop through each index.
let progress = [Int](1...15)
for i in progress {
    if (i % 5 == 0) {
        print(i)
    }
    else {
        print("\(i) ", terminator: "")
    }
}
// 1 2 3 4 5
// 6 7 8 9 10
// 11 12 13 14 15

// Better way. This is faster than previous two.
// Loop starting at 1 and going to 15.
for i in 1...15 {
    if (i % 5 == 0) {
        print(i)
    }
    else {
        print("\(i) ", terminator: "")
    }
}
// 1 2 3 4 5
// 6 7 8 9 10
// 11 12 13 14 15

// Loop through values in an array.
let anArray = ["Bob", "Billy", "Joe"]
for value in anArray {
    print(value)
}
// Bob
// Billy
// Joe

// Loop through keys, and values in a dictionary.
let aDict = ["name": "Ritchie", "age": 5, "city": "Rexburg"]
for (key, value) in aDict {
    print("\(key): \(value)")
}
// city: Rexburg
// age: 5
// name: Ritchie

// Loop through something a certain number of times.
// Faster if you don't need index.
var answer = 1
for _ in 1...5 {
    answer *= 5
}
// 3125

/************** WHILE ***************/
/* While Loop */
var start = 1
let finish = 16
while (start < finish) {
    if (start % 5 == 0) {
        print(start)
    }
    else {
        print("\(start) ", terminator: "")
    }
    
    start++;
}
print("Start: \(start)")

/* Repeat While */
start = 1
repeat {
    if (start % 5 == 0) {
        print(start)
    }
    else {
        print("\(start) ", terminator: "")
    }
    
    start++;
} while start < finish
print("Start: \(start)")

/************** Conditional Statements ***************/
// Must evaluate to true, false, or nil. Nothing else is accepted.

/* If statements */

if (true != false) {
    print("True doesn't equal False")
}
// True doesn't equal False

if (true == true) {
    print("True does equal True")
}
// True does equal True

if (false == false) {
    print("False does equal False")
}
// False does equal False

/* If Else statements */

/* Comparing Strings */
let aFirstName = "Ritchie"
var anotherFirstName = "Richard"
if (aFirstName == anotherFirstName) {
    print("Names are equal")
}
else {
    print("Names are not equal")
}
// Names are not equal

anotherFirstName = "Ritchie"
if (aFirstName == anotherFirstName) {
    print("Names are equal")
}
else {
    print("Names are not equal")
}
// Names are equal

/* Comparing Arrays */

let myArray = [Int](1...5)
var myOtherArray = [Int](1...4)
if (myArray == myOtherArray) {
    print("Arrays are equal")
}
else {
    print("Arrays are not equal")
}
// Arrays are not equal

// Doesn't compare by length.
myOtherArray = [Int](6...10)
if (myArray == myOtherArray) {
    print("Arrays are equal")
}
else {
    print("Arrays are not equal")
}
// Arrays are not equal

// Compares by length
myOtherArray = [Int](1...5)
if (myArray == myOtherArray) {
    print("Arrays are equal")
}
else {
    print("Arrays are not equal")
}
// Arrays are equal

/*************************
 *FUNCTIONS
 *************************/
// Failing for some reason!!

func calculateDisplacement(firstPosition: Double, secondPosition: Double) -> Double {
    return secondPosition - firstPosition
}

func calcRealReturn(investmentRate: Double, inflationRate: Double) -> Double {
    return 100 * (((1 + investmentRate)/(1 + inflationRate)) - 1)
}

func calcGains(purchasePrice: Double, marketPrice: Double) -> Double {
    return (marketPrice - purchasePrice) / purchasePrice
}

func removeCharacterFromString(aString: String, aChar: Character) -> String {
    
    var builtString:[Character] = []
    for chr in aString.characters {
        if chr != aChar {
            builtString.append(chr)
        }
    }
    
    return String(builtString)
}

let displacement = calculateDisplacement(3, secondPosition: 10)
print(displacement)

let realReturn = calcRealReturn(0.12, inflationRate: 0.03)
print(realReturn)

let gained = calcGains(12 , marketPrice: 30)
print(gained)

let newString = removeCharacterFromString("Ritchie", aChar: "i")
print(newString)

/* ARRAYS */
// Add null in dictionary and array. Get index out of bounds. Null for key. Null closure to sort.

// Helpful Methods
var testArray = [Int](arrayLiteral: 10,15,20,25)
print(testArray.contains(10))
print(testArray.indexOf(20))
print(testArray.count)
testArray.removeAll(keepCapacity: true)
print(testArray.count)

// Nasty Path
// When nil is in array it doesn't seem to matter. Works as expected.
var arrayNIl: [AnyObject?] = [10,nil,"String"]
print("Array Contents: \(arrayNIl)")
print("Array Size: \(arrayNIl.count)")
for i in arrayNIl {
    print(i)
}

// Nasty Path
// Accessing the index of a nil value in the array. Works fine.
print(arrayNIl[1])

// Nasty Path
// Out of bounds exception. The index of 3 is out of bounds.
// ERROR: fatal error: Array index out of range
//print(arrayNIl[3])

// Nasty Path
// Null Closure
// ERROR: Cannot sort array with NIL.
//print(arrayNIl.sort(<))

/* DICTIONARIES */

var dictNil = ["Ritchie": "Developer", "George": "Teacher", "Chris": "Office Clerk", "Jason": "Programmer"]

// Nasty Path
// When we loop through a dictionary with a value of type nil that is where it stops. (it acts like we reached the end of the array)
dictNil["Chris"] = nil

dictNil["Crozier"] = "Plumber"

for (key, value) in dictNil {
    print("\nKey: \(key)\nValue: \(value)")
}

dictNil.removeValueForKey("Chris")

// Nasty Path
// Cannot use nil for a key value in dictionaries.
//dictNil[nil] = "blah"

for (key, value) in dictNil {
    print("\nKey: \(key)\nValue: \(value)")
}





