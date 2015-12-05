import UIKit

// =============== Objects ====================
class Person {
    var fName: String
    var lName: String
    var favColor: String
    // Defalt Constructor
    init () {
        self.fName = ""
        self.lName = ""
        self.favColor = ""
    }
    // Overloaded Constructor
    init (fName: String, lName: String, favColor: String) {
        self.fName = fName
        self.lName = lName
        self.favColor = favColor
    }
    // Overloaded Constructor
    init (stringObject: String) {
        var peopleProperties = stringObject.componentsSeparatedByString(", ")
        self.fName = peopleProperties[0]
        self.lName = peopleProperties[1]
        self.favColor = peopleProperties[2]
    }
    
    func toString() -> String {
        return "\(fName), \(lName), \(favColor)"
    }
}

let person1 = Person()
let person2 = Person(fName: "Richard", lName: "Henke", favColor: "Henke")
let person3 = Person(stringObject: "Robert, Fitz, Orange")

print(person1.toString())
print(person2.toString())
print(person3.toString())

let person4 = Person(stringObject: person2.toString())
print(person4.toString())

person1.fName = "Bob"
print(person1.toString())
person1.fName = "Robert"
print(person1.toString())

// Create a reference to the object "person1" and call it "person5"
let person5 = person1
print(person5.toString())

// ===== Nasty Path: Try changing the original reference data which could foul someone up if they were trying to pass by value
// Try changing the name of the original object person1 by using the reference person5
person5.fName = "Harrison"
person5.lName = "Ford"
print(person1.toString())
print(person5.toString())

// --------- Inheritance --------------
class Furniture {
    var name: String
    var price: Double
    var description: String
    
    init() {
        self.name = ""
        self.price = 0.00
        self.description = ""
    }
    
    func toString() -> String {
        return " Name: \(self.name)\n Price: $\(self.price)\n Description: \(self.description)"
    }
}

let mattress = Furniture()
mattress.name = "Sealy Mattress"
mattress.price = 399.99
mattress.description = "Something people sleep on."
print("\n\(mattress.toString())")

class Chair: Furniture {
    var legs: Int
    override init() {
        self.legs = 0
    }
    override func toString() -> String {
        return super.toString() + "\n Number of Legs: \(self.legs)"
    }
}
let sofa = Chair()

sofa.name = "LazyBoy Sofa"
sofa.price = 499.99
sofa.description = "Something people sit on."
sofa.legs = 4
print("\n\(sofa.toString())")


// =============== Structs ====================
struct Rectangle {
    let width: Int
    let height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    // Add methods to Struct (You can't do that in C++)
    func getArea() -> Int {
        return width * height
    }
}

let shape1 = Rectangle(width: 5, height: 10)
print("The area is: \(shape1.getArea())ft^2")



// =============== Enums ====================

enum TraficLight {
    case Red, Green, Yellow
}

var rexburgLight = TraficLight.Red
print(rexburgLight)

// ---- Failable Enum
enum TraficLightFailable {
    case Red, Green, Yellow
    init?(symbol: Character) {
        switch symbol {
        case "R":
            self = .Red
        case "G":
            self = .Green
        case "Y":
            self = .Yellow
        default:
            return nil
        }
    }
}

let greenLight = TraficLightFailable(symbol: "G")
print(greenLight!)
let greenLightFailable = TraficLightFailable(symbol: "B")
print(greenLightFailable)

// =============== Tuples ====================

class Sandwich {
    let name: String
    let bread: String
    let meat: String
    let cheese: String
    init(name: String, bread: String, meat: String, cheese: String) {
        self.name = name
        self.bread = bread
        self.meat = meat
        self.cheese = cheese
    }

    func toString() -> String {
        return " Name: \(name)\n Bread: \(bread)\n Meat: \(meat)\n Cheese: \(cheese)\n"
    }
    func ingredients() -> (String, String, String, String) {
        return (name, bread, meat, cheese)
    }
    
}

let arbys = Sandwich(name: "Arby's", bread: "Bun", meat: "Beef", cheese: "Cheddar")
print(arbys.toString())
print(arbys.ingredients())

let (_,_,meatStuff,cheeseStuff) = arbys.ingredients()

//let (_,_,meatStuff,cheeseStuff) = (name: "Arby's", bread: "Bun", meat: "Beef", cheese: "Cheddar")

let subWaySandwich1 = ("Subway BLT", "Wheat", "Bacon", "American")
let subWaySandwich2 = ("Subway BLT", "Wheat", "Bacon", 100)








