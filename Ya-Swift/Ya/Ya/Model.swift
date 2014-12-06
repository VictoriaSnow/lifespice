//
//  Model.swift
//  Ya
//
//  Created by Victoria Bian on 12/2/14.
//  Copyright (c) 2014 Lifespice. All rights reserved.
//

import UIKit
import CoreData
@objc(Model)
class Model: NSManagedObject {
    @NSManaged var item: String
    @NSManaged var date: String
    @NSManaged var info: String
}
