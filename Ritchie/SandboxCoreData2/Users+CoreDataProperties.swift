//
//  Users+CoreDataProperties.swift
//  SandboxCoreData2
//
//  Created by Ritchie Fitzgerald on 10/29/15.
//  Copyright © 2015 fitz. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Users {

    @NSManaged var email: String?
    @NSManaged var name: String?
    @NSManaged var number: String?

}
