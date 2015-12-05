//
//  equipment.swift
//  OperatorOverload
//
//  Created by Ritchie Fitzgerald on 11/17/15.
//  Copyright © 2015 fitz. All rights reserved.
//

import Foundation

class Equipment {
    let name: String
    let type: String
    var price: Double
    
    init(name:String, type: String, price:Double) {
        self.name = name
        self.type = type
        self.price = price
    }
    
    func toString() -> String {
        return "Name: [\(self.name)], Type: [\(self.type)], Price: [\(self.price)]"
    }
}