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
        var today: NSDate = NSDate()
        var numDays: Int = 0
        var calendar: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        var unitFlags:NSCalendarUnit = .DayCalendarUnit
        let components = calendar.components(unitFlags, fromDate: today, toDate: eventDate, options: nil) as NSDateComponents
        numDays = components.day
        return numDays + 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

