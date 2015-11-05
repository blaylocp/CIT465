//
//  card.swift
//  overloading
//
//  Created by Preston Blaylock on 10/29/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import Foundation

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

struct Card {
    
    let rank: Int
    let suit: Suit
}