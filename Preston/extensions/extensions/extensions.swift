//
//  extensions.swift
//  extensions
//
//  Created by Preston Blaylock on 11/3/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import Foundation



/**************************
 * Extension adding Functionality
 **************************/

extension Double {
    var absoluteValue: Double {
        if self < 0.0 {
            return self * -1
        } else {
            return self
        }
    }
}


/**************************
 * Extension Adopting a Protocol
 **************************/

protocol TextRepresentable {
    var asText: String { get }
}



extension Int : TextRepresentable {
    var asText: String {
        return "The number is \(self)"
    }
}

extension Double : TextRepresentable {
    var asText: String {
        return "The double is \(self)"
    }
}


/**************************
* Extension overriding something
**************************/
extension String {
    mutating func append(c:Character) {
        self = "This function no longer works"
    }
}