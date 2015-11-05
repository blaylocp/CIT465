//
//  subscripts.swift
//  extensions
//
//  Created by Preston Blaylock on 10/29/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import Foundation


struct Multiplier{
    var value: Int
    subscript(multiplier: Int) -> Int{
        get{
            return value * multiplier
        }
    }
}


/******************
 * Subscript needs a getter
 ******************/
//struct Percentage{
//    var value: Double
//    subscript(getPercentage:Double) -> (){
//        set{
//            self.value *= getPercentage
//        }
//   }
//}

struct Percentage{
    var value: Double
    subscript(getPercentage:Double) -> Double{
        get{
            return value * getPercentage
        }
    }
}


var preston = Person(name:"Preston", age:25, job:"Programmer")
var ritchie = Person(name:"Ritchie", age:25, job:"Programmer")
var jon = Person(name:"Jon Doe", age: 17, job:"Janitor")

var peopleArray = [1:preston, 2:ritchie, 3:jon]

struct Person{
    let name: String
    var age: Int
    var job: String
}

class company{
    var people:[Int:Person] =  peopleArray
    
    subscript(id:Int)->Person{
        get{
            return people[id]!
        }
        set(newValue){
            people[id] = newValue
        }
    }
}


struct Appender {
    var value: String
    subscript(appendValue:String) -> String{
        get{
            return value + " " + appendValue
        }
        set(newValue){
            value =  value + " " + newValue
        }
    }
}
