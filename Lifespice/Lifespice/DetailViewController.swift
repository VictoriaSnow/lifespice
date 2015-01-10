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
            }
            if let date = self.eventDateLabel {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateStyle = .LongStyle
                dateFormatter.timeStyle = .NoStyle
                date.text = dateFormatter.stringFromDate(detail.eventDate)
            }
            
        }
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


}

