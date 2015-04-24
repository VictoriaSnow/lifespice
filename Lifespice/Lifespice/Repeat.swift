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
        let repeatList = [Repeat(title: "Never"), Repeat(title: "Every Week"), Repeat(title: "Every 2 Weeks"), Repeat(title: "Every Month"), Repeat(title: "Every Year")]
        return repeatList
    }
    
    class func repeatTypes() -> [String] {
        let neverType = RepeatType.Never.rawValue
        let weeklyType = RepeatType.Weekly.rawValue
        let biWeeklyType = RepeatType.BiWeekly.rawValue
        let monthlyType = RepeatType.Monthly.rawValue
        let yearlyType = RepeatType.Yearly.rawValue
        return [neverType, weeklyType, biWeeklyType, monthlyType, yearlyType]
    }

}