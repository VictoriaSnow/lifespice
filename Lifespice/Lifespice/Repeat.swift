//
//  Repeat.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/8/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit

@objc
class Repeat {
    enum RepeatType: String {
        case Never = "Never", Weekly = "Every Week", BiWeekly = "Every 2 Weeks", Monthly = "Every Month", Yearly = "Every Year"
        init() {
            self = .Never
        }
        
    }
    
    var type: RepeatType = RepeatType()
    
    let title: String
    
    init(title: String) {
        self.title = title
    }
    
    class func allRepeats() -> Array<Repeat> {
        let repeatList = [Repeat(title: RepeatType.Never.rawValue), Repeat(title: RepeatType.Weekly.rawValue), Repeat(title: RepeatType.BiWeekly.rawValue), Repeat(title: RepeatType.Monthly.rawValue), Repeat(title: RepeatType.Yearly.rawValue)]
        return repeatList
    }
}