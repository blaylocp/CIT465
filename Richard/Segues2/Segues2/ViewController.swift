//
//  ViewController.swift
//  Segues2
//
//  Created by Richard on 12/3/15.
//  Copyright © 2015 RichardHenke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBAction func unwindSecondView(segue: UIStoryboardSegue) {
        print("Unwind fired in first view")
        
        if let svc = segue.sourceViewController as? SecondViewController {
            self.dataLabel.text = svc.txtMessage.text
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

