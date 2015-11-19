import UIKit
import Darwin


// ====================== Variables ======================================================
// ===== Strings
var str = "Hello, playground"
print(str)
print(str + "!")

var stringOne = "1"
var one:Int? = Int(stringOne)

print("This is the number UNO: \(one!)")
print("This is the number UNO: \(one)")

// ===== Integers

var thirteen = 13.00
print(thirteen)

// Nasty Path: trying to convert a double to an Int
//var thirteenInt:Int = thirteen
//print(thirteen)

// Path: trying to convert an int to a double (down casting)
var fourteen = 14
var fourteenDouble:Int = fourteen
print(fourteen)

// ====================== Arrays & Loops =================================================
//Array
var friends = ["Ritchie", "Preston", "Johnny", "Joe"]

//for loops
for friend in friends {
    print(friend)
}

//for loops
for friend in friends.sort(<) {
    print(friend)
}

for var i: Int = 1; i < 10; i++ {
    if i == 3 {
        print("i is equal to \(i)")
    }
}

var numbers = [Int]()
// This didn't work because the index isn't zero
//for i in 65...90 {
//    numbers.insert(i,atIndex:i)
//    print("Print forwards: \(numbers[i])")
//}
// This does work because the starting number is zero
for i in 0...15 {
    numbers.insert(i,atIndex:i)
    print("Print forwards: \(numbers[i])")
}
print("------------------")

for index in numbers.reverse() {
    print("Print backwards: \(index)")
}

numbers.sort(<)
numbers.sort(>)
//numbers.sort(a...z)  Tried to sort alphebetically like this and didn't work

//Create an arrray using a range
var alphaNum = [Int](65...90)
var myString = ""
// Loop 5 times and print out the alphabet then set string back to empty
// Converts numeric values to unicode characters and apends them to a string
for i in 1...5 {
    for i in alphaNum {
        myString.append(UnicodeScalar(i))
    }
    print("Iteration \(i): " + myString)
    myString = ""
}



// This little example will count the letter 'w' in the following sentance
var sentance = "Hello world. I wonder sometimes why witty programers use such witless wonderings when testing their work."
var letterCount = 0
// Iterates through the text one character at a time
for singleChar in sentance.characters {
    if singleChar == "w" {
        letterCount++
    }
}
print(sentance)
print("There were \(letterCount) 'w's in the text!")
//Array()
// Nasty path for array
var nastyFriends:[String?] = ["Ritchie", "Preston", "Johnny", "Joe"]
nastyFriends.append(nil)
nastyFriends.append("joe")
print(nastyFriends)

// Happy path for removeAtIndex


// ====== Nasty path for removeAtIndex - Remove non existing 6th item
// nastyFriends.removeAtIndex(6);
// Fatal error : Array index out of range

// ====== Nasty path for removeAtIndex - Negative values
// nastyFriends.removeAtIndex(-1);
// Fatal error : Array index out of range

// Loops, Conditional Statements, Functions, Variables, Constants, Arrays, Dictionaries, Optionals(Swift)



// ====================== Constants ======================================================

let constantStr = str
print(constantStr)
// Nasty path: Trying to change constant by appending another character
//constantStr.append("d")

let fullName = "Richard Henke"
print(fullName)

// Nasty path - trying to change the string constant "Richard Henke" to "Robert Henke" constant
//fullName = "Robert Henke"
//print(fullName)
// Error: trying to change a let constant
let number = 100
print(number)

// Nasty path - trying to change the constant
//number = 200
//print(number)
// Error: trying to change a let constant

// ====================== Dictionaries ===================================================
var mattresses: [String: String] = ["Sealy": "Barryton", "Simmons": "World Class"]

print("Is the mattress dictionary empty? \(mattresses.isEmpty)")
print(mattresses)
print(mattresses.reverse())
print(mattresses)

mattresses.updateValue("New Field", forKey: "Sealy")
print(mattresses)

print("Is the mattress dictionary empty? \(mattresses.isEmpty)")
print(mattresses)
// Try adding to the dictionary
mattresses["Enso"] = "Strata"
print(mattresses)

// ====================== Bad Code Examples for Dictionaries =================================

// ===== Nasty path for Disctionaries - Ty to update value that doesn't exist.
mattresses.updateValue("This shouldn't work", forKey: "BobbyJoe")
print(mattresses)


// ===== Nasty path for Disctionaries - Trying to use a different type than string for secaon value
//let carsAndColors: [String: String] = ["Mustang": "Blue", "VW": 12]
//print(carsAndColors)
// Expected a string value

// ----- These two examples do not work because they have a nill

// ===== Nasty path for Disctionaries - Try to put nil in first or second value
//let carsAndColors: [String: String] = ["Mustang": "Blue", "VW": nil]
//print(carsAndColors)
// Expected a string value

//let carsAndColors: [String: String] = ["Mustang": "Blue", nil: "Green"]
//print(carsAndColors)
// Expected a string value