//
//  operators.swift
//  overloading
//
//  Created by Preston Blaylock on 10/23/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import Foundation
//import Swift



/*****************************************
* Overridding the + Operator
*****************************************/
func +(left: Card, right: Card) -> Int{
    return left.rank + right.rank
}


/*****************************************
* Overridding the + Operator
*****************************************/
func -(left: Card, right: Card) -> Int{
    let value = left.rank - right.rank
    if(value < 0){
        return 0
    } else {
        return value
    }
}

/*****************************************
 * Creating your own operator 
 *****************************************/
infix operator ~^ {}
func ~^(base: Int, power:Int) -> Int {

    if (power == 0){
        return 1
    }
    
    var answer: Int = base
    var increment: Int = base
    var i:Int, j:Int
    for(i = 1; i < power; i++){
        for(j = 1; j < base; j++){
            answer += increment
        }
        increment = answer
    }
    return answer
}

/*****************************************
* Creating your own operator
*****************************************/
infix operator ~^~ {associativity left precedence 1}
func ~^~(left: Int, right:Int) -> Int {
    return left * (left + right)
}




/*****************************************
 * Nasty Overridding
 *****************************************/
//func + (left: Int, right: Int) -> Int{
//    return left - right
//}
//
//func - (left: Int, right: Int) -> Int {
//    return left * right
//}