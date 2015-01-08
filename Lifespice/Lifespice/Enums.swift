//
//  Enums.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/7/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit

enum Reminder: String {
    case None = "None", OneDayUntil = "1 Day Until", TwoDaysUntil = "2 Days Until", ThreeDaysUntil = "3 Days Until", OneWeekUntil = "1 Week Until"
    init() {
        self = .None
    }
}

enum Repeat: String {
    case Never = "Never", Weekly = "Every Week", BiWeekly = "Every 2 Weeks", Monthly = "Every Month", Yearly = "Every Year"
    init() {
        self = .Never
    }
    
}

enum Status: String {
    case Upcoming = "UpComing", Past = "Past"
    init() {
        self = .Upcoming
    }
}

//enum Category: String {
//    case Private = "Private", Work = "Work", Birthday = "Birthday", Anniversary = "Anniversary", Home = "Home", School = "School"
//}
//
//enum CustomCategory: String {
//    
//}