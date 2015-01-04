//
//  Model.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/3/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit
import CoreData

@objc(Model)

class Model: NSManagedObject {
    @NSManaged var eventTitle: String
    @NSManaged var eventDate: NSDate
    
    @NSManaged var eventRepeat: String
    @NSManaged var eventReminder: String
    @NSManaged var eventCategory: String
    @NSManaged var eventImportant: Bool
    
    @NSManaged var timeStamp: NSDate
}
