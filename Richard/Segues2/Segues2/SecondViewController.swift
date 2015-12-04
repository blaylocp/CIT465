//
//  SecondViewController.swift
//  Segues2
//
//  Created by Richard on 12/3/15.
//  Copyright © 2015 RichardHenke. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var txtMessage: UITextField!
    
    @IBAction func dismissViewButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
