//
//  main.swift
//  SandboxClosures
//
//  Created by Ritchie Fitzgerald on 11/16/15.
//  Copyright © 2015 fitz. All rights reserved.
//

import Foundation

print("START")

var students = [["Name": "Max", "GPA": 3.8], ["Name": "Ryan", "GPA": 3.9], ["Name": "Dillon", "GPA": 4.0], ["Name": "Linzi", "GPA": 3.7]]

print("Normal Run")
print("----------------------------")
for student in students {
    print(student)
}

func sortByGPAASC(student1:Dictionary<String,NSObject>, student2:Dictionary<String,NSObject>) -> Bool {
    let grade1 = student1["GPA"] as! Double
    let grade2 = student2["GPA"] as! Double
    return grade1 < grade2
}

func sortByGPADSC(student1:Dictionary<String,NSObject>, student2:Dictionary<String,NSObject>) -> Bool {
    let grade1 = student1["GPA"] as! Double
    let grade2 = student2["GPA"] as! Double
    return grade1 > grade2
}

func sortByNameASC(student1:Dictionary<String,NSObject>, student2:Dictionary<String,NSObject>) -> Bool {
    let name1 = student1["Name"] as! String
    let name2 = student2["Name"] as! String
    return name1 < name2
}

func sortByNameDSC(student1:Dictionary<String,NSObject>, student2:Dictionary<String,NSObject>) -> Bool {
    let name1 = student1["Name"] as! String
    let name2 = student2["Name"] as! String
    return name1 > name2
}

students = students.sort(sortByGPAASC)

print("Grade Ascending Order")
print("----------------------------")
for student in students {
    print(student)
}

students = students.sort(sortByGPADSC)

print("Grade Descending Order")
print("----------------------------")
for student in students {
    print(student)
}

students = students.sort(sortByNameASC)

print("Name Ascending Order")
print("----------------------------")
for student in students {
    print(student)
}

students = students.sort(sortByNameDSC)

print("Name Descending Order")
print("----------------------------")
for student in students {
    print(student)
}

students = students.sort {
    (item1, item2) in
    let grade1 = item1["GPA"] as! Double
    let grade2 = item2["GPA"] as! Double
    return grade1 > grade2
}

/* Functions That Use Closures */

func displayGreeting(@noescape completed: () -> Void) {
    print("Welcome Br. Barney!")
    print("This is the program where you get to see me test closures.")
    completed()
}

displayGreeting() {
    print("Performing Pperations! (closure)")
    students = students.sort(sortByNameDSC)
}

/* Functions That Return Functions */

func makeMultiplier(amount: Int) -> () -> Int {
    var total = 1
    
    func multiplier() -> Int {
        total *= amount
        return total
    }
    
    return multiplier
}

let multiplyByTwo = makeMultiplier(2)
print(multiplyByTwo())
print(multiplyByTwo())
let multiplyByFive = makeMultiplier(5)
print(multiplyByFive())
print(multiplyByFive())
let multiplyByTen = makeMultiplier(10)
print(multiplyByTen())
print(multiplyByTen())

/* Closure Attributes */
var completionHandlers: [() -> Void] = []

// @escape closure attribute
func displayProgramTitle(completed: () -> Void) -> Void {
    print("Closure Sandbox")
    print("by: Ritchie Fitzgerald")
    completionHandlers.append(completed)
}
func displayAlternateGreeting(completed: () -> Void) -> Void {
    print("Hi Br. Barney!")
    print("Sorry that was immature before, lets get more serious.")
    completionHandlers.append(completed)
}

// Inline closure use.
displayProgramTitle({print("ProgramTitle function successfully completed!")})

// Trailing closure use.
displayAlternateGreeting() {
    print("AlternateGreeting function successfully completed")
}

for handler in completionHandlers {
    handler()
}

// @autoclosure closure attribute
// Without autoclosure
func evaluateExpression(expression: () -> Bool) {
    if expression() {
        print("It's true")
    }
}
// Have to use curly braces
evaluateExpression({2 > 1})

// With autoclosure
func executeExpression(@autoclosure expression: () -> Bool) {
    if expression() {
        print("It's true")
    }
}
// Don't have to use curly braces
executeExpression(2 > 1)

print("END")