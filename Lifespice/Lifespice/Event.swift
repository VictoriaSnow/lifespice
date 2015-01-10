//
//  Event.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/9/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import Foundation
import CoreData

class Event: NSManagedObject {

    @NSManaged var eventCategory: String
    @NSManaged var eventDate: NSDate
    @NSManaged var eventImportant: NSNumber
    @NSManaged var eventReminder: String
    @NSManaged var eventRepeat: String
    @NSManaged var eventTitle: String
    @NSManaged var timeStamp: NSDate

}
