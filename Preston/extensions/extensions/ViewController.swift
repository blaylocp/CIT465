//
//  ViewController.swift
//  extensions
//
//  Created by Preston Blaylock on 10/29/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import UIKit

@objc protocol  Vehicle{
    optional var nauticalMilesTraveled: Double { get set }
    var milesTraveled: Double { get set }
    optional func returnNauticalMiles() -> Double
    func returnMiles() -> Double
}

class ViewController: UIViewController {


   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*****************************************
        * Extensions
        *****************************************/
        
        /*
         *  extension Double {
         *     var absoluteValue: Double {
         *         if self < 0.0 {
         *             return self * -1
         *         } else {
         *             return self
         *         }
         *     }
         *  }
         *
         *  extension Int : TextRepresentable {
         *      var asText: String {
         *          return "The number is \(self)"
         *      }
         *  }
         *
         *  extension Double : TextRepresentable {
         *      var asText: String {
         *          return "The double is \(self)"
         *      }
         *  }
         */
        
        
        print("\nExtensions\n")
        
        let aDouble = -4.5
        print(aDouble.absoluteValue)
        
        let aInt = 4
        print(aInt.asText)
        print(aDouble.asText)
        print(aDouble.absoluteValue.asText)
        
        // Override Something
        var aTestString = "This is a test"
        let aChar :Character = "C"
        aTestString.append(aChar)
        print(aTestString)
        
        /*****************************************
         * Subscripts
         *****************************************/
         
         print("\nSubscripts\n")
        
        /*
        *   struct Multiplier{
        *        var value: Int
        *        subscript(multiplier: Int) -> Int{
        *            get{
        *               return value * multiplier
        *           }
        *        }
        *   }
        */
        
        let two =  Multiplier(value:2)
        print(two[3])
        print(two[4])
        print(two[23])
        // two[2] = 10 // Cannot set a get only
        
        
        /*
        *   struct Percentage{
        *       var value: Double
        *       subscript(getPercentage:Double) -> Double{
        *           get{
        *               return value * getPercentage
        *           }
        *       }
        *   }
        */
        
        let value = Percentage(value:10.0)
        print(value[0.3])

        /*
        *   class company{
        *       var people:[Int:Person] =  peopleArray
        *
        *       subscript(id:Int)->Person{
        *           get{
        *               return people[id]!
        *           }
        *           set(newValue){
        *               people[id] = newValue
        *           }
        *       }
        *   }
        */
        
        let walmart = company()
        print(walmart[1])
        walmart[1] = Person(name: "Betty", age:19, job:"Secretary")
        print(walmart[1])
        walmart[2] = Person(name: "Kiley Bickmore", age: 23, job:"Photographer")
        print(walmart[2])
        print("\n")
        print(walmart.people)
        
        // Passing nil
        // print(walmart[nil]) // Compile Error
        
        // Wrong Datatype
        // print(walmart["test"]) // Compile Error
        
        // Numaric subscripts are negative
        print("\n")
        walmart[-2] = Person(name: "Richard Lionheart", age: 50, job:"King")
        print(walmart.people)
        print("\n")
        print(walmart[-2])
        
        print("\n")
        // print(walmart[-1]) This throws a error because there is not a person in that value.
        
        // Subscripts aren't numaric
        //walmart["test"] = Person(name: "Chad Hickman", age: 2, job: "Toddler") // The subscript is a int 
        
        var aAppender = Appender(value:"Hello")
        print(aAppender["World"])
        aAppender["world"] = "world"
        print(aAppender)
        aAppender["test"] = "wordly"
        print(aAppender)
        
        
        /*****************************************
        * Protocol swift
        *****************************************/
        
        print("\nProtocol\n")

        /*
         *   protocol Animal {
         *       var numberOfLegs : Int {get}
         *       var age : Int {get set}
         *       func makeSound() -> String
         *       func travel() -> String
         *   }
         */
        
        
        class Lion: Animal {
            var numberOfLegs: Int = 4
            var age : Int
            func makeSound() -> String {
                return "Roar"
            }
            func travel() -> String {
                return "The Lion is walking on \(numberOfLegs) Legs"
            }
            
            init(age: Int){
                self.age = age
            }
            
            init(){
                self.age = 0
            }
        }
        
        struct Bird: Animal {
            var numberOfLegs: Int
            var age: Int
            func makeSound() -> String {
                return "Chirp Chirp"
            }
            func travel() -> String {
                return "The Bird is walking on \(numberOfLegs) Legs"
            }
        }
        
        let simba = Lion(age:2)
        var pete = Bird(numberOfLegs: 2, age: 10)
        
        
        simba.numberOfLegs = 2  // You can do this because simba is of type Lion not Type Animal
        simba.numberOfLegs = 4
        simba.age = 5
        
        print(simba.numberOfLegs)
        print(simba.age)
        print(simba.makeSound())
        print(simba.travel())
        
        print("\n")
        
        pete.numberOfLegs = 6
        pete.age = 2
        print(pete.makeSound())
        print(pete.travel())
        
        var scar: Animal = Lion()
        // scar.numberOfLegs = 6 // Can't do this because scar is type Animal which this property is read type only
        scar.age = 20
        
        
        // optional functions in the protocol
            class Airplane : Vehicle {
                let wingSpan: Double
                @objc var nauticalMilesTraveled: Double
                @objc var milesTraveled: Double
                @objc func returnNauticalMiles() -> Double {
                    return nauticalMilesTraveled
                }
                @objc func returnMiles() -> Double {
                    return milesTraveled
                }
                init(wingSpan: Double, nauticalMilesTraveled: Double, milesTraveled:Double ){
                    self.wingSpan = wingSpan
                    self.nauticalMilesTraveled = nauticalMilesTraveled
                    self.milesTraveled = milesTraveled
                }
            
            }

            class Truck : Vehicle {
                let tireSize: Double
                @objc var milesTraveled: Double
                @objc func returnMiles() -> Double {
                    return milesTraveled
                }
                init(tireSize: Double, milesTraveled: Double){
                    self.tireSize = tireSize
                    self.milesTraveled = milesTraveled
                }
            }
        
        
            let aTruck : Vehicle = Truck(tireSize: 11, milesTraveled: 30.2)
            let aPlane : Vehicle = Airplane(wingSpan: 30.3, nauticalMilesTraveled: 2.3, milesTraveled: 2.3)
        
        
            print(aPlane.returnMiles())
            print(aPlane.returnNauticalMiles!())
            print(aTruck.returnMiles())
            // print(aTruck.returnNauticalMiles!())  // This breaks bad execution aTruck doesn't have nauticalMiles

        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

