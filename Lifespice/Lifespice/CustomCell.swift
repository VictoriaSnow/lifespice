//
//  CustomCell.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/9/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellDateLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellNumberLabel: UILabel!
    
    func countdownDays(eventDate: NSDate) -> Int {
        if (isToday(eventDate)) {
            return 0
        }
        var numDays: Int = 0
        var today: NSDate = NSDate()
                var calendar: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        var unitFlags:NSCalendarUnit = .DayCalendarUnit
        let components = calendar.components(unitFlags, fromDate: today, toDate: eventDate, options: nil) as NSDateComponents
        numDays = components.day
        
        if (numDays < 0) {
            return numDays
        }
        return numDays + 1
        
        
      }
    
    func isToday(date1: NSDate) ->Bool {
        var today: NSDate = NSDate()
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        var unitFlags: NSCalendarUnit = .YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit
        let component1 = calendar.components(unitFlags, fromDate: date1)
        let componentToday = calendar.components(unitFlags, fromDate: today)
        if (component1.day == componentToday.day) {
            if (component1.month == componentToday.month) {
                if (component1.year == componentToday.year) {
                    return true
                }
            }
        }
        return false
        
    }
    
    
}
