//: Playground - noun: a place where people can play

import UIKit


//var firstArray = ("One", "Two", "Three", "Four", "Five")
//var secondArray = ("Six", "Seven", "Eight", "Nine", "Ten")

/************************************************************
*                     Subscripts
*************************************************************/

// Read-Only Subscript
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

struct MovieListings {
    var movieTitles: String
    subscript(title: String) -> String {
        get {
            return movieTitles
        }
        set {
            movieTitles += title
        }
    }
}

var whatIsIt = MovieListings(movieTitles: "The Great Gatsby")
print(whatIsIt.movieTitles)
print(whatIsIt["The Great Gatsby"])
whatIsIt["Hello World"] = "Hello Kitty"
print(whatIsIt["Hello World"])
whatIsIt["Hello Kitty"] = ""
print(whatIsIt["Hello World"])

//struct TicTacToe {
//    var board: Array<Array<String>>
//
//    init () {
//        for i in 0...3 {
//            for j in 0...3 {
//                self.board = board
//            }
//        }
//    }
//    subscript(row: Int, col: Int) -> String {
//        get {
//            return board[row][col]
//        }
//        set {
//            board[row][col]
//        }
//    }
//}
//
//var board1 = TicTacToe()
//
//extension String {
//    subscript(index: Int) -> Character {
//        return self.characters[index]
//    }
//}
/************************************************************
 *                     Protocols
 *************************************************************/


protocol Furniture {
    var sku: String {get set}
    var price: Double {get set}
    var description: String {get}
    func toString() -> String
}

class SealyMattress: Furniture {
    var sku: String
    var price: Double
    var description: String
    init() {
        self.sku = ""
        self.price = 0.00
        self.description = ""
    }
    func toString() -> String {
        return self.description
    }
}

 var barrytonPlush = SealyMattress()
barrytonPlush.sku = "SPQ_BARRYTON"
barrytonPlush.price = 599.99
barrytonPlush.description = "Soft and plush."

struct SimmonsBeautyRest: Furniture {
    var sku: String
    var price: Double
    var description: String
    
    func toString() -> String {
        return self.description
    }
}
 /************************************************************
 *                     Extensions
 *************************************************************/
 
 // --- Build an extension to the String class ------
 // This is an example of an extension. It extends the string class.
extension String {
    
    // This is what actually works in the updated version of swift
    func letterOfOccurence(theChar: Character) -> Int {
        var numOfChars = 0
        
        for letter in self.characters {
            if letter == theChar {
                numOfChars++
            }
        }
        return numOfChars
    }
}

var characters = "A random string.".characters
// Print
for i in characters {
    print(i)
}

// ===================== START Happy Path =========================
// Uses the extended function we added earlier
var numberOfAs: Int = "a random string".letterOfOccurence("a")
print("How many A's: \(numberOfAs)")
// ===================== END Happy Path =========================

// ===================== START Nasty Paths: Not nasty paths because they are not LOGICAL ERRORS =========================

// --- Nasty Path: try to use extension on somehting other than a string
//var notAString: Int = 4.letterOfOccurence(4)
// Error: No member letterOfOccurences in Int methods

//// --- Nasty Path: try to pass int into extension instead of char
//print("How many A's: \("Nasty Path: try to pass int into extension instead of char".letterOfOccurence(4))")
//Error: Expected type Character not Int
//
//// --- Nasty Path: try to pass int into extension instead of char
//print("How many A's: \("Nasty Path: try to pass int into extension instead of char".letterOfOccurence("as"))")
//Error: Expected type Character not String

//// --- Nasty Path: try to pass nil into extension instead of char
//print("How many A's: \("Nasty Path: try to pass int into extension instead of char".letterOfOccurence(nil))")
////Error: Expected type Character not nil
//extension String {
//    mutating func append(c:Character) {
//        self = "This function no longer works"
//    }
//}

// ===================== END Nasty Paths =========================
