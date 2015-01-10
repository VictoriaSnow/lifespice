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
        return [Reminder(title: "None"), Reminder(title: "1 day until"), Reminder(title: "2 days until"), Reminder(title: "3 days until"), Reminder(title: "1 week until")]

    }
    
    class func reminderTypes() -> [String] {
        let noneType = ReminderType.None.rawValue
        let oneDayUntilType = ReminderType.OneDayUntil.rawValue
        let twoDaysUntil = ReminderType.TwoDaysUntil.rawValue
        let threeDaysUntilType = ReminderType.ThreeDaysUntil.rawValue
        let oneWeekUntilType = ReminderType.OneWeekUntil.rawValue
        return [noneType, oneDayUntilType, twoDaysUntil, threeDaysUntilType, oneWeekUntilType]
    }
    
}
