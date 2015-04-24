//
//  DetailViewController.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/3/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {



    @IBOutlet weak var eventTitleLabel: UILabel!

    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventCountdownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var detailItem: Event? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Event = self.detailItem {
            if let title = self.eventTitleLabel {
                title.text = detail.eventTitle
//                println(title.text!)
            }
            if let date = self.eventDateLabel {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateStyle = .LongStyle
                dateFormatter.timeStyle = .NoStyle
                date.text = dateFormatter.stringFromDate(detail.eventDate)
//                println(date.text!)
            }
            if let countdown = self.eventCountdownLabel {
                let daysLeft = self.countdownDays(detail.eventDate)
                countdown.text = toString(daysLeft)
            }
        }
    }
    
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
    
    
    @IBAction func cancelEvent(segue:UIStoryboardSegue) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveEvent(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditEvent" {
            if let myEvent = self.detailItem {
                let event = self.detailItem
                (segue.destinationViewController as NewEventViewController).myEvent = event

            }
        }
    }


}

