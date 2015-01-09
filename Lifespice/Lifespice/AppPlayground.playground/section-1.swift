// Playground - noun: a place where people can play

import UIKit

class Reminder {
    enum Type: String {
        case None = "None", OneDayUntil = "1 Day Until", TwoDaysUntil = "2 Days Until", ThreeDaysUntil = "3 Days Until", OneWeekUntil = "1 Week Until"
        init() {
            self = .None
        }
    }
    
    var type: Type = Type()
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    func reminderList() -> Array<Reminder> {
        return [Reminder(title: "None"), Reminder(title: "1 Day Until"), Reminder(title: "2 Days Until"), Reminder(title: "3 Days Until"), Reminder(title: "1 Week Until")]
    }
}

