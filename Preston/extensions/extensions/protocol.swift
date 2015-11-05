//
//  protocol.swift
//  extensions
//
//  Created by Preston Blaylock on 11/3/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import Foundation


protocol Animal {
    var numberOfLegs : Int {get}
    var age : Int {get set}
    func makeSound() -> String
    func travel() -> String
}


