//
//  ViewController.swift
//  overloading
//
//  Created by Preston Blaylock on 10/23/15.
//  Copyright © 2015 Preston Blaylock. All rights reserved.
//

import UIKit









class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        
        let jackHearts = Card(rank:11, suit: Suit.Hearts)
        let threeHearts = Card(rank: 3, suit: Suit.Hearts)
        
        print(jackHearts + threeHearts)
        print(jackHearts - threeHearts)
        print(threeHearts - jackHearts)
        print(2 + 5)
        print(3~^4)
        print(10 ~^~ 4)
        
        10 ~^~ 4

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

