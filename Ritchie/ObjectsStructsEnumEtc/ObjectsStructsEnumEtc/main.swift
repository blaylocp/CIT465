//
//  main.swift
//  ObjectsStructsEnumEtc
//
//  Created by Ritchie Fitzgerald on 10/28/15.
//  Copyright © 2015 fitz. All rights reserved.
//

import Foundation
import AVFoundation

/* OBJECTS */
class Vehicle {
    let VID = arc4random_uniform(UInt32.max)
    var owner: String
    let make: String
    let model: String
    let year: String
    let numOfDoors: String
    var speed = 0.0
    
    struct Dimensions {
        let width: Double
        let length: Double
        let height: Double
    }
    
    init(owner: String, make: String, model: String, year: String, numOfDoors: String) {
        self.owner = owner
        self.make = make
        self.model = model
        self.year = year
        self.numOfDoors = numOfDoors
    }
    
    func buildDimensions(width: Double, length: Double, height: Double) -> Dimensions {
        return Dimensions(width: width, length: length, height: height)
    }
    
    func makeNoise() {}
    
    func printVehicle() {
    	print("Vehicle")
    	print("----------------------")
    	print("Owner: \(owner)")
    	print("Make: \(make)")
    	print("Model: \(model)")
    	print("Year: \(year)")
    	print("numOfDoors: \(numOfDoors)")
    }
}

class Car: Vehicle {
    
    override func makeNoise() {
    	print("Beep Beep!")
    }
}

class Truck: Vehicle {
    
    override func makeNoise() {
    	print("Honk Honk!")
    }
}

var myVehicle = Vehicle(owner: "Ritchie Fitzgerald", make: "Toyota", model: "Camry", year: "2002", numOfDoors: "2")
print(myVehicle.printVehicle())
var myCar = Car(owner: "Ritchie Fitzgerald", make: "Toyota", model: "Camry", year: "2002", numOfDoors: "2")
var myTruck = Truck(owner: "Ritchie Fitzgerald", make: "Toyota", model: "Camry", year: "2002", numOfDoors: "2")
var myTruckDimensions = myTruck.buildDimensions(6, length: 10, height: 4)

print(myTruckDimensions)
myCar.makeNoise()
myTruck.makeNoise()

/* STRUCTS */

infix operator ^^ {}
func ^^(radiux: Double, power: Double) -> Double {
    return pow(radiux, power)
}

struct Rectangle {
    let width: Double
    let length: Double
    
    func calculateArea() -> Double {
        return width * length
    }
}

struct Square {
    let width: Double
    
    func calculateArea() -> Double {
        return width ^^ 2
    }
}

struct Circle {
    let pie = 3.14
    let radius: Double
    
    class HalfCircle {
        var radius: Double
        
        init(radius: Double) {
            self.radius = radius
        }
    }
    
    func halfCircleBuilder() -> HalfCircle {
        let half = self.radius / 2.0
        let insideHalfCircle = HalfCircle(radius: half)
        
        return insideHalfCircle
    }
    
    func calculateArea() -> Double {
        return pie * (radius ^^ 2)
    }
}

var myRect = Rectangle(width: 4, length: 2)
var mySquare = Square(width: 2)
var myCircle = Circle(radius: 4)

print(myRect)
print(mySquare)
print(myCircle)

print("Area: \(myRect.calculateArea())")
print("Area: \(mySquare.calculateArea())")
print("Area: \(myCircle.calculateArea())")

var halfCircle = myCircle.halfCircleBuilder()

print(halfCircle.radius)

/* ENUMS */

enum Produce: String {
    case Apple, Banana, Orange, Mango, Pinapple
}

var fruit = Produce.Apple
switch fruit {
case .Apple :
    print("You have an \(Produce.Apple.rawValue)")
case .Banana :
    print("You have an \(Produce.Banana.rawValue)")
default:
    print("Pick a better fruit.")
}

fruit = Produce(rawValue: "Banana")!
switch fruit {
case .Apple :
    print("You have an \(Produce.Apple.rawValue)")
case .Banana :
    print("You have an \(Produce.Banana.rawValue)")
default:
    print("Pick a better fruit.")
}

// Nasty Path
// Pass a raw value that is not part of the enum.
// ERROR: fatal error: unexpectedly found nil while unwrapping an Optional value
//fruit = Produce(rawValue: "NoValue")!

// Nasty Path
// Pass an empty raw value
// ERROR: fatal error: unexpectedly found nil while unwrapping an Optional value
//fruit = Produce(rawValue: "")!

enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var americanDoll = Barcode.UPCA(0, 2345, 234234, 45)
var russianDoll = Barcode.QRCode("ALJBFBSSJFBALJBFHB")

switch americanDoll {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("This item is of type UPCA and its barcode is \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
    print("This item is of type UPCA and its barcode is \(productCode)")
}

switch russianDoll {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("This item is of type UPCA and its barcode is \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
    print("This item is of type UPCA and its barcode is \(productCode)")
}









