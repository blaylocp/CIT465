//
//  main.swift
//  objects
//
//  Created by Preston Blaylock on 10/1/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import Foundation

class Shape {
    var numberOfSides = 0
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shape)
print(shape.numberOfSides)
print(shape.simpleDescription())


// No Initalize
// var shape2 = Shape(2) // Cannot convert value of type 'Int' to expected argument type ()...


class Car {
    var make : String
    var speedMPH : Double
    
    init(make: String, speedMPH: Double) {
        self.make = make
        self.speedMPH = speedMPH
    }
    
    // Proceedure
    func changeSpeed(speedChange: Double){
        speedMPH += speedChange
    }
    
    // Proceedure
    func carDescription() -> String {
        return "The \(make) is going \(speedMPH)"
    }
}


var mustang = Car(make: "Mustang", speedMPH: 0)

mustang.speedMPH = 2 // Change speed 
print(mustang.speedMPH)
mustang.changeSpeed(6) // This proceedure is useless
print(mustang.speedMPH)
print(mustang.carDescription())

// Can reuse the values
mustang = Car(make: "Dart", speedMPH: 9)

print(mustang.carDescription())

// Out of Order Argument
// var camaro = Car(speedMPH: 1, make: "Camaro") // Argument ' ' must precede Argument ' '

// Missing Argument
// var camaro = Car(make: "Camaro") // Missing Argument for parameter ... in Call

// Tried let
let camaro = Car(make: "Camaro", speedMPH: 0)
camaro.make = "El Camino"
print(camaro.make)

// Can change the values but can't reuse the variable
//camaro = Car(make: "Camaro", speedMPH: 15) // Cannot assign to value ' ' is a 'let' constant


// Without initializing
// var car; // Type annotation missin in pattern

// Initialize to nill
// var car = nil // Type of expression is ambiguous without more context

// Initalize with nil
// var car = Car(make: nil, speedMPH: nil) // Nil is not compatible with expected arguments type 'Double'



/*
 * Using Let
 */

class Person {
    let name: String
    let height: Double
    // Can initialize like this or using the init function
    // let height : Double = 0
    
    init (name: String, height: Double){
        self.name = name
        self.height = height
    }
    
    func descPerson() -> String {
        return "\(name) is \(height) feet tall"
    }
}

var john = Person(name: "John", height: 6.7)

// Try to change the let
// john.name = "Rachel"



// Without initializing
// var John;  // Type annotation missin in pattern

