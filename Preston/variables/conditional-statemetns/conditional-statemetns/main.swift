//
//  main.swift
//  conditional-statemetns
//
//  Created by Preston Blaylock on 9/28/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import Foundation

/*
 * IF Statements
 */

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

/*
* Switch Statements
*/
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



