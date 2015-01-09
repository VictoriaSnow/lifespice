//
//  Reminder.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/8/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit

@objc
class Reminder {
    enum ReminderType: String {
        case None = "None", OneDayUntil = "1 day until", TwoDaysUntil = "2 days until", ThreeDaysUntil = "3 days until", OneWeekUntil = "1 week until"
        init() {
            self = .None
        }
    }
    
    var type: ReminderType = ReminderType()
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    class func allReminders() -> Array<Reminder> {
        let reminderList = [Reminder(title: ReminderType.None.rawValue), Reminder(title: ReminderType.OneDayUntil.rawValue), Reminder(title: ReminderType.TwoDaysUntil.rawValue), Reminder(title: ReminderType.ThreeDaysUntil.rawValue), Reminder(title: ReminderType.OneWeekUntil.rawValue)]
        return reminderList
    }
}
