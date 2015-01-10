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
        var today: NSDate = NSDate()
        var numDays: Int = 0
        var calendar: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        var unitFlags:NSCalendarUnit = .DayCalendarUnit
        let components = calendar.components(unitFlags, fromDate: today, toDate: eventDate, options: nil) as NSDateComponents
        numDays = components.day
        
        return numDays + 1
        
      }
    
}
