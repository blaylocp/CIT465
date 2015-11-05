//
//  ViewController.swift
//  SandboxCoreData2
//
//  Created by Ritchie Fitzgerald on 10/22/15.
//  Copyright © 2015 fitz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var entryName: UITextField!
    @IBOutlet weak var entryNumber: UITextField!
    @IBOutlet weak var entryEmail: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func savePressed(sender: AnyObject) {
        print("Name: \(entryName.text!)")
        print("Number: \(entryNumber.text!)")
        print("Email: \(entryEmail.text!)")
        
//        Without NSManageObject subclass
//        let entity =  NSEntityDescription.entityForName("Users",
//            inManagedObjectContext: self.managedContext)
//        
//        let user = NSManagedObject(entity: entity!,
//            insertIntoManagedObjectContext: self.managedContext)
//        
//        user.setValue(entryName.text!, forKey: "name")
//        user.setValue(entryNumber.text!, forKey: "number")
//        user.setValue(entryEmail.text!, forKey: "email")
        
        var user: Optional<Users>
        
//      Nasty Path
//      Error: 'NSInternalInconsistencyException', reason: '+entityForName: could not locate an entity named 'Nonexistent' in this model.'
//      Reason: Nonexistent doesn't exist in any of my entities.
        
//        do {
//            user = try NSEntityDescription.insertNewObjectForEntityForName("Nonexistent",
//                inManagedObjectContext: self.managedContext) as! Users
//        } catch let error as NSError  {
//                print("Could not save \(error), \(error.userInfo)")
//        }
        
//      Nasty Path
//      Error: 'NSInternalInconsistencyException', reason: '+entityForName: could not locate an entity named '' in this model.'
//      Reason: I used an empty string.
//        do {
//            user = try NSEntityDescription.insertNewObjectForEntityForName("",
//                inManagedObjectContext: self.managedContext) as! Users
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
        
//      Happy Path
        user = NSEntityDescription.insertNewObjectForEntityForName("Users",
            inManagedObjectContext: self.managedContext) as! Users
        
        user!.name = entryName.text!
        user!.number = entryNumber.text!
        user!.email = entryEmail.text!
        
        do {
            try self.managedContext.save()
        } catch {
            print("Did not save")
        }
    }
    

    @IBAction func loadPressed(sender: AnyObject) {
        var fetchRequest: Optional<NSFetchRequest>
//      Nasty Path
//      Error: 'NSInternalInconsistencyException', reason: 'NSFetchRequest could not locate an NSEntityDescription for entity name 'Nonexistent''
//      Reason: Used an entity name that did not exist.
//        do {
//            fetchRequest = NSFetchRequest(entityName: "Nonexistent")
//        } catch let error as NSError {
//            print("Could not save \(error), \(error.userInfo)")
//        }
        
//      Nasty Path
//      Error: 'NSInternalInconsistencyException', reason: 'NSFetchRequest could not locate an NSEntityDescription for entity name '''
//      Reason: Used an empty string.
//        do {
//            fetchRequest = NSFetchRequest(entityName: "")
//        } catch let error as NSError {
//            print("Could not save \(error), \(error.userInfo)")
//        }
        
//      Happy Path
        fetchRequest = NSFetchRequest(entityName: "Users")
        
        do {
//        Without NSManageObject subclass
//            let results = try self.managedContext.executeFetchRequest(fetchRequest)
//            for result in results {
//                print(result.valueForKey("name")!)
//                print(result.valueForKey("number")!)
//                print(result.valueForKey("email")!)
//            }
            let results = try self.managedContext.executeFetchRequest(fetchRequest!) as! [Users]
            for result in results {
                print(result.name!)
                print(result.number!)
                print(result.email!)
            }
        } catch {
            print("Did not recieve results.")
        }
    }
}

