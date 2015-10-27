//
//  main.swift
//  variables
//
//  Created by Preston Blaylock on 9/23/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import Foundation


/**************************************************************************
 * VARIABLES
 **************************************************************************/

/* Implicit Values */
var myInt = 42                          // Datatypes get a impliciate value
var myDouble = 52.2
var myString = "This is a test"
//var myStringQuote = 'Single Quotes'   // Strings need double quotes
//var char = 'q'                        // No Implicate char
var char = "t"                          // This is just a string
//var largeNumber = 1,000,000
var largeNumber = 1_000_000             // You can format large numbers like this

print(myInt)
print(myDouble)
print(myString)
print(largeNumber)
print("\tEnd Implicit Values Example\n")

/* Explicit Values */
var myInt2: Int = 42
var myDouble2: Double = 52.2
var myFloat: Float = 4
var myString2: String = "Test"
//var char: Character = 't'             // This doesn't work either
var char2: Character = "T"
// var char3: Character = "TEST"        // Doesn't work explictied described as a char

print(myInt2)
print(myDouble2)
print(myString2)
print(myFloat)
print("\tEnd Explicit Values Example\n")

/* Different Datatypes */
//myInt = 52.2      // INT CAN'T BE CHANGE TO DOUBLE
myDouble = 42       // DOUBLE CAN BE ASSIGNED IT BUT IT KEEPS IT AS A DOUBLE
print(myDouble)
//myInt = "56"        // String to Int no go

//myString = 42     // String has to be String
myString = "ste"    // Can change string
print(myString)

//myInt2 = 52.2     // Same as above
myDouble2 = 423     // Same as about
print(myDouble2)

char = "TEST"       // This works because it is a string
//char2 = "TEST"      // This doesn't work because we explicatedly initialized it as a char
print("\tEnd Different Datatypes Example\n")

/* Negative Values */
var negInt = -93
// var negInt2: UInt = -93      // Overflows when unsigned
print(negInt)
print("\tEnd Negative Values Example\n")

// Passed by value or reference 
var valueOrRef = 10
func changer(){
    valueOrRef = 3
}

changer()
print(valueOrRef)               // Passed by reference
print("\tEnd value or reference Example\n")



/**************************************************************************
* CONSTANTS
**************************************************************************/

let impicitInteger = 70
let impicitDouble  = 70.0
let implicitString = "TEST"
let explicitDouble: Double = 70

//impicitInteger = 34
//impicitDouble = 73.2
//implicitString = 23.3

print(explicitDouble)
print("\tEnd let Example\n")


/**************************************************************************
* Strings Contactination
**************************************************************************/

let label = "The width is "
let width = 94
//let widthLabelWrong = label + width
let widthLabel = label + String(width)
print(widthLabel)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
print(appleSummary)
print(fruitSummary)

let oneAndOneHalf = 1.5
//let newAppleSummary = "I have \(apples + oneAndOneHalf) apples." //doens't work
let newAppleSummary = "I have \(Double(apples) + oneAndOneHalf) apples."
print(newAppleSummary)

let name = "Preston"
let greeting = "Hello \(name)! How are you today"
//let greeting2 = "Hello \(name + oranges)! How are you"
//print(Greeting)
print(greeting)
print("\tEnd String Contact Example\n")



/**************************************************************************
* Arrays
**************************************************************************/
let arrayTest = [10,34,45,60,23]
//  arrayTest = [34,52,63,47,23]  // Can't change


print(arrayTest[0])

// Array bulit in functions
print(arrayTest[arrayTest.startIndex])
// print(arrayTest[arrayTest.startIndex.predecessor()])  // Out of bounds
print(arrayTest[arrayTest.startIndex.successor()])
print(arrayTest[arrayTest.startIndex.advancedBy(1)])
//print(arrayTest[arrayTest.endIndex])                   // Out of Bounds <- EXC_BAD_INSTRUCTIONS (code=EXC_i386_INVOP, subcode=0x0)
print(arrayTest[arrayTest.endIndex.predecessor()])
print("\tEnd Array Index Example\n")



let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sort(backwards)
print(names)
print(reversed)

// reversed is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
print(arrayTest.sort(<))
print(arrayTest) // Test to see if it is different
print(arrayTest.sort(>))
print("\tEnd Array sort Example\n")


print(arrayTest.count)
print("\tEnd Array count Example\n")

let closedRange = [Int](55...90)
for index in closedRange {
    print(index)
}
print("\tEnd Closed Range Example\n")


// Inserting items in an array
var emptyArray = [String]()

print(emptyArray)
emptyArray.insert("first element",atIndex: 0)
emptyArray.append("second element")
//emptyArray.append(["second element", "third element"])        // Doesn't work
// emptyArray += "third element" // This doesn't work
emptyArray += ["third element"]
emptyArray += ["fourth element, fifth element"]
emptyArray.appendContentsOf(["sixth element", "seventh element"])   // This use to be the extend method
emptyArray.insertContentsOf(["before first element"], at:0)         // This use to be the splice method

print(emptyArray)
print("\tEnd inserting Example\n")


// Remove from Array 
emptyArray.removeFirst()
emptyArray.removeAtIndex(3)
emptyArray.removeLast()
emptyArray.removeRange(0...1)
// emptyArray.removeAtIndex(10) // Out of Bounds
emptyArray.removeAll()
print(emptyArray)
print("\tEnd removing Example\n")

// Array with different types
var arrayDifferentTypes = [10, "Test", 5.6]
let arrayDifferentTypes2 = [10, "Test", 3.4]

print(arrayDifferentTypes)
print("\tEnd Differnt Type Example\n")

// Array with nil value
// var arrayNil = [10,34,45,nil]                        // Doesn't Allow Nil
// let arrayNil = [10, 34, 45, nil]                     // Same

// var arrayNil: [AnyObject] = [10,nil,"String"]        // Type of expression is ambiguous  doesn't work
// var arrayNil: [AnyObject]? = [10,nil,"String"]
var arrayNIl: [AnyObject?] = [10,nil,"String"]          // This is how you can have a nil in an array
print(arrayNIl)
print("\tEnd Nil Example\n")

// Passed by value or function
var changeArr = ["Test", "test2"]
func changeArray(var stringArray: [String]) {
    print(stringArray)
    stringArray = ["changed", "Changed2"]
    print(stringArray)
}

// Change the array
changeArray(changeArr)                                  // Arrays are passed by value
print(changeArr)
print("\tEnd Array Passed By Value Example\n")


// Insert out of bounds
var outOfBounds:NSMutableArray = [1,2,3,4,5]
////outOfBounds.insert(20, atIndex: 20)     // Out of bounds
//outOfBounds[20] = 19
print(outOfBounds)
print("\tEnd Array insert high number Example\n")


// Out of bounds
//print(outOfBounds[20])
    
    
// Negative index number
//print(outOfBounds[-1])
    
    
// Remove something out of the array not there.
//outOfBounds.removeAtIndex(5)


/**************************************************************************
* Dictionaries
**************************************************************************/

// Create Dictionary 
var occupation = ["Preston": "Web Developer", "Ritchie": "Web Developer"]
let occupation2 = ["Preston": "Web Developer", "Ritchie": "Web Developer"]
let emptyDictionary = [String: Float]()
var emptyDictionary2 = [:]

// Index Dictionary
print(occupation["Preston"])
print("\tEnd regular index Example\n")

print(occupation["John"])           // IF there is no key it will output nil
print("\tEnd No Key Example\n")

// Dictionary Built In Functions
print(occupation.count)
// print(occupation.startIndex)                         // Nasty don't do
// print(occupation.endIndex)                           // Nasty don't do
// print(occupation.endIndex.predecessor())             // Doesn't work
print(occupation[occupation.startIndex])
// print(occupation[occupation.endIndex])               // Out of bounds
print(occupation[occupation.startIndex.successor()])
// print(occupation[occupation.endIndex.predecessor()]) // No predecessor()
// print(occupation[occupation.endIndex.successor()])      // Out of Bounds
print(occupation[occupation.startIndex.advancedBy(1)])
print("\tEnd index Example\n")

// Add to dictionary
// occupation.append(["John": "Farmer"])
occupation["John"] = "Farmer"
occupation["Zach"] = "Teacher"                            // Order is not guaranteed
// occupation2["John"] = "Farmer"                         // Constant can't be changed
// occupation["Tommy"] = nil                              // Cannot assign value of type () to type ...
print(occupation)
print("\tEnd adding Example\n")


// Modify a value 
occupation["Ritchie"] = "Student"
occupation.updateValue("Plumber", forKey: "Zach")
print(occupation)
print("\tEnd modifying Example\n")

// Remove from a dictionary
occupation["John"] = nil
occupation.removeValueForKey("Zach")
// occupation2["Preston"] = nil
occupation.removeAll()
print(occupation)
print("\tEnd removing Example\n")

// Different Types 
var random = [1: "test", "Name": "Robert"]
print(random)
print(random[1])
print(random["Name"])
print("\tEnd different types Example\n")

// Nil 
//var dicNIl = ["John": nil, "Robert": "plubmer"]
//print(dicNIl)

// Passed by value or reference 
occupation = ["Preston": "Web Developer", "Ritchie": "Web Developer"]
print(occupation)
func changeDic(){
    occupation.removeAll()
    print(occupation)
    occupation = ["John":"Plumber"]
}

changeDic()
print(occupation)               // Passed by referene if you change it
print("\tEnd pass by value or reference test Example\n")

/**************************************************************************
* Optionals
**************************************************************************/

// Creating Optional
var optionalString: String? = nil
print(optionalString == nil)

var optionalInt: Int? = nil
print(optionalInt == 0)         // nil does not equal zero 
print("\tEnd optional compare Example\n")


// Optional in control statement
var optionalName: String? = "Preston"
var greeting2 = "Hello!"
if let name = optionalName {
    greeting2 = "Hello, \(name)"
}
print(greeting2)

var optionalName2: String? = nil
var greeting3 = "Hello!"
if let name = optionalName2 {
    greeting3 = "Hello, \(name)"
}
print(greeting3)
print("\tEnd optional in if statement Example\n")

// Optional in array and dictionary
var opArray: [Int?] = [1, nil, 3]
var opDict: [String:String?] = ["Firstname":"Joe", "Lastname": nil]
//var opDict: [String?:String] = ["Firstname":"Joe", "Lastname": nil]
print(opArray)
print("\tEnd optional array Example\n")


/**************************************************************************
* Conditional Statements (If statement)
**************************************************************************/

let number = 5
let string = "test"

if number > 7{
    print("bigger")
} else  if number == 7 {
    print("equal")
} else {
    print("smaller")
}

//if number > 5.6 {
//    print("compare") // Different Types not allowed
//}

//if string > 8{
//    print("works") // not allowed
//}

// Compare String
if string == "test" {
    print("compare String")
} else {
    print("can't do this")
}

// Compare String Case
if string == "Test" {
    print("different case equal")
} else {
    print("different case not equal")
}

// Greater than test 1
if string > "Tester" {
    print("string greater") // Why is this greater:
} else if string < "Tester"{
    print("string less than")
} else {
    print("string equal")
}

// Greater than test 2
if "test" > "Tester" {
    print("greater") // Why is this greater
} else if "test" < "Tester"{
    print("less than")
} else {
    print("equal")
}

// Greater than test 3
if "Test" > "Tester" {
    print("greater")
} else if "Test" < "Tester"{
    print("less than")
} else {
    print("equal") // Why is this equal
}

// Greater than test 3
if "Test" > "Tester" {
    print("greater")
} else if "Test" < "Tester"{
    print("less than")
} else {
    print("equal") // Why is this equal
}


/**************************************************************************
* Conditional Statements (Switch Statements)
**************************************************************************/

let vegetable = "red pepper"
let vegetable2 = "red pepper"
let num = 5.0

// Switch needs to be a variable
switch vegetable {
    
case "celery":
    
    print("Add some raisins and make ants on a log.")
    
case "cucumber", "watercress":
    
    print("That would make a good tea sandwich.")
    
case let x where x.hasSuffix("pepper"):
    
    print("Is it a spicy \(x)?")
    
default:
    
    print("Everything tastes good in soup.")
}

// Has Prefix
switch vegetable2 {
    
case "celery":
    
    print("Add some raisins and make ants on a log.")
    
case "cucumber", "watercress":
    
    print("That would make a good tea sandwich.")
    
case let x where x.hasPrefix("red"):
    
    print("Is it a spicy \(x)?")
    
default:
    
    print("Everything tastes good in soup.")
}

// Prefix no match
switch vegetable2 {
    
case "celery":
    
    print("Add some raisins and make ants on a log.")
    
case "cucumber", "watercress":
    
    print("That would make a good tea sandwich.")
    
case let x where x.hasPrefix("Pepper"):
    
    print("Is it a spicy \(x)?")
    
default:
    
    print("Everything tastes good in soup.")
}

// No Default Case (Doesn't Work)
//switch vegetable2 {
//
//case "celery":
//
//    print("Add some raisins and make ants on a log.")
//
//case "cucumber", "watercress":
//
//    print("That would make a good tea sandwich.")
//
//case let x where x.hasPrefix("Pepper"):
//
//    print("Is it a spicy \(x)?")
//
//    // Switch must be exhaustive consider adding a default case
//}

// Different datatypes (Doesn't Work)
//switch vegetable2 {
//
//case 1:
//
//    print("Add some raisins and make ants on a log.")
//
//case "cucumber", 5.3:
//
//    print("That would make a good tea sandwich.")
//
//case let x where x.hasPrefix("Pepper"):
//
//    print("Is it a spicy \(x)?")
//
//default:
//
//    print("Everything tastes5 good in soup.")
//}
// Binary operator '~=' cannot be applied to operands ot type ' ' and ' '


switch num {
    
case 5:  // Does auto casting to a double
    
    print("Works")
    
case 4.3, 2:
    
    print("works")
    
default:
    print("None of these")
}


/**************************************************************************
* Loop (for in)
**************************************************************************/

/*
*  For in are like For Each loops
*/

// For in loop
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
print("\tEnd of Loop: Regular\n")


// Different Key word
for test in 1...5 {
    print("\(test) times 5 is \(test * 5)")
}
print("\tEnd of Loop: Different Index\n")



// For In without index
let base = 3
let power = 10
var answer = 1

for _ in 1 ... power {
    answer *= base
}
print("\t\(base) to the power of \(power) is \(answer)")
print("\tEnd of Loop: Without Index\n")




// for in  using an array
let names2 = ["Anna", "Alex", "Brian", "Jack"]
for name in names2 {
    print("Hello, \(name)!")
}
print("\tEnd of Loop: Using array\n")



// Empty array
let names3 = [String]()
for name in names3 {
    print("Hello, \(name)!")
}
print("\tEnd of Loop: Empty Array\n") // Prints out nothing



// nil in array
let names4: [String?] = ["Anna", nil, "Brian", "Jack"]
for name in names4 {
    print("Hello, \(name)!")
}
print("\tEnd of Loop: Nil in Array\n")



// for in  using an dictionary
let numberOfFruit = ["apples": 8, "oranges": 6, "kiwis": 4]
for (fruitName, fruitCount) in numberOfFruit {
    print("\(fruitName)s have \(fruitCount) legs")
}
print("\tEnd of Loop: Using Dictionary\n")



// Empty Dictionary
let emptyDictionary3 = [String:Float]()
for (key, value) in emptyDictionary3 {
    print("\(key)s have \(value) legs")
}
print("\tEnd of Loop: Empty Dictionary\n") // Prints out nothing



// for in  using an dictionary (Different Datatypes)
let person = ["Name": "preston", "age": 6, "height": 5.6]
for (key, value) in person {
    print("\(key) : \(value)")
}
print("\tEnd of Loop: Dictionary differnt types\n")
// print(person["Name"])



// Doesn't Work
//for value in "Test"{
//    print(value))
//}



// Doesn't work
//for (key, value) in "Test"{
//    print("\(key) : \(value)")
//}


/**************************************************************************
* Loop (While)
**************************************************************************/
var n = 2
while n < 100 {
    n = n * 2
}
print(n)
print("\tEnd of Loop: While Loop\n")



/**************************************************************************
* Loop (Repeat While) // Like Do While
**************************************************************************/
var m = 2
repeat{
    m = m * 2
} while m < 100
print(m)
print("\tEnd of Loop: Repeat While Loop\n")


/**************************************************************************
* Loop (For)
**************************************************************************/
var forLoop = 0
for var i = 0; i < 2; i++ {
    forLoop += i
}
print(forLoop)
print("\tEnd of Loop: For Loop\n")