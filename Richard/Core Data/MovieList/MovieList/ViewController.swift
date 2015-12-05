//
//  ViewController.swift
//  MovieList
//
//  Created by Richard on 11/23/15.
//  Copyright © 2015 RichardHenke. All rights reserved.
//

import UIKit
import CoreData

// Add UITableViewDataSource to class declaration
class ViewController: UIViewController, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    // Creates a mutable array of Strings to store movie names
    //SIMPLE START    var titles = [String]()
    var movies = [NSManagedObject]()
    
    // Implement the addMovie function
    @IBAction func addMovie(sender: AnyObject) {
        let alert = UIAlertController(title: "New Movie",
            message: "Add a new movie title",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
            style: .Default,
            handler: { (action:UIAlertAction) -> Void in
                
                let textField = alert.textFields!.first
                self.saveTitle(textField!.text!)
                self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
            animated: true,
            completion: nil)
    }
    
    // Saving in Core Data
    func saveTitle(title: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Movie", inManagedObjectContext:managedContext)
        // Link the Movie entity in Core Data model to NSMnaged Object
        let movie = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        movie.setValue(title, forKey: "title")
        do {
            try managedContext.save()
            movies.append(movie)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies to Watch"
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return movies.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
            let person = movies[indexPath.row]
            cell!.textLabel!.text = person.valueForKey("title") as? String
            return cell!
    }
    
    // Fetching with Core Data
    // ======== Happy Path: Normal fetch of Movie =========
    //    override func viewWillAppear(animated: Bool) {
    //        super.viewWillAppear(animated)
    //
    //        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //        let managedContext = appDelegate.managedObjectContext
    //        // Fetch the Movie Object/Table
    //        let fetchRequest = NSFetchRequest(entityName: "Movie")
    //
    //        do {
    //            let results =
    //            try managedContext.executeFetchRequest(fetchRequest) // Returns an array of objects
    //            movies = results as! [NSManagedObject]
    //        } catch let error as NSError {
    //            print("Could not fetch \(error), \(error.userInfo)")
    //        }
    //    }
    
    //     ======== Happy Path: filtered request fetch of Movie =========
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // Fetch the Movie Object/Table
        let fetchRequest = NSFetchRequest(entityName: "Movie")
        
        // create a filter
        //         let filter = "Star Wars"
        //        let predicate = NSPredicate(format: "title LIKE %@", filter)
        // This filters for movie titles that start with the letter s and have anything else afterwards
        let predicate = NSPredicate(format: "title LIKE %@", "S*")
        fetchRequest.predicate = predicate
        
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest) // Returns an array of objects
            movies = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    // ======== Nasty Path: fetch of empty string =========
    // Result: libc++abi.dylib: terminating with uncaught exception of type NSException
    //    override func viewWillAppear(animated: Bool) {
    //        super.viewWillAppear(animated)
    //
    //        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //        let managedContext = appDelegate.managedObjectContext
    //        // Fetch the Movie Object/Table
    //        let fetchRequest = NSFetchRequest(entityName: "")
    //
    //        do {
    //            let results =
    //            try managedContext.executeFetchRequest(fetchRequest) // Returns an array of objects
    //            movies = results as! [NSManagedObject]
    //        } catch let error as NSError {
    //            print("Could not fetch \(error), \(error.userInfo)")
    //        }
    //    }
    
    //     ======== Nasty Path: fetch an entity that doesn't exist =========
    //     Result: libc++abi.dylib: terminating with uncaught exception of type NSException
    //        override func viewWillAppear(animated: Bool) {
    //            super.viewWillAppear(animated)
    //
    //            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //            let managedContext = appDelegate.managedObjectContext
    //            // Fetch the Movie Object/Table
    //            let fetchRequest = NSFetchRequest(entityName: "dogCrap")
    //
    //            do {
    //                let results =
    //                try managedContext.executeFetchRequest(fetchRequest) // Returns an array of objects
    //                movies = results as! [NSManagedObject]
    //            } catch let error as NSError {
    //                print("Could not fetch \(error), \(error.userInfo)")
    //            }
    //        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

