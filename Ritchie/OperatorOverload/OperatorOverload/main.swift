//
//  main.swift
//  OperatorOverload
//
//  Created by Ritchie Fitzgerald on 11/17/15.
//  Copyright © 2015 fitz. All rights reserved.
//

import Foundation

func ==(left:Equipment, right:Equipment) -> Bool {
    if left.name == right.name
    && left.type == right.type
        && left.price == right.price {
            return true
    }
    
    return false
}

func +(left:Equipment, right:Double) -> Equipment {
    left.price += right
    return left
}

func +(left:Double, right:Equipment) -> Equipment {
    right.price += left
    return right
}

func -(left:Equipment, right:Double) -> Equipment {
    left.price -= right
    return left
}

func -(left:Double, right:Equipment) -> Equipment {
    right.price -= left
    return right
}

func <(left:Equipment, right:Equipment) -> Bool {
    return left.price < right.price
}

func >(left:Equipment, right:Equipment) -> Bool {
    return left.price > right.price
}

// Sorts an array of equipment in ascending order
prefix operator => {}
prefix func =>(equipments:[Equipment]) -> [Equipment] {
    return equipments.sort {
        (equip1, equip2) -> Bool in
        return equip1 < equip2
    }
}

// Sorts an array of equipment in desscending order
prefix operator <= {}
prefix func <=(equipments:[Equipment]) -> [Equipment] {
    return equipments.sort {
        (equip1, equip2) -> Bool in
        return equip1 > equip2
    }
}

var equipments:[Equipment] = []

var fireRed = Equipment(name: "Fire Red", type: "Tractor", price: 90_000.0)
var fireRed2 = Equipment(name: "Fire Red", type: "Tractor", price: 90_000.0)
var blueTrue = Equipment(name: "Blue True", type: "Truck", price: 20_000.0)
var theDrill = Equipment(name: "The Drill", type: "Drill", price: 8_000.0)

equipments.append(fireRed)
equipments.append(blueTrue)
equipments.append(theDrill)

fireRed = fireRed + 5_000
blueTrue = blueTrue - 3_000

print(fireRed.toString())
print(blueTrue.toString())

fireRed = 5_000 - fireRed

print("Is blue less than drill? \(blueTrue < theDrill)")
print("Is blue greater than drill? \(blueTrue > theDrill)")
print("Is red equal to blue? \(fireRed == blueTrue)")
print("Is red equal to red? \(fireRed == fireRed2)")

// Sorts the array descending first and then loops through each equipment item.
print("Ascending")
print("--------------------")
for equipment in =>equipments {
    print(equipment.toString())
}

// Sorts the array ascending first and then loops through each equipment item.
print("Descending")
print("--------------------")
for equipment in <=equipments {
    print(equipment.toString())
}














