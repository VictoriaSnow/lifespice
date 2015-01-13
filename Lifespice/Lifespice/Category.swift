//
//  Category.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/7/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit


class Category {
    enum CategoryTag: String {
        case Private = "Private", Work = "Work", School = "School", Birthday = "Birthday", Holiday = "Holiday", Anniversary = "Anniversary"
        init() {
            self = .Private
        }
    }
    let title: String
    let image: UIImage?
    let list: [String]
    
    init(title: String, image: UIImage?, list: [String]) {
        self.title = title
        self.image = image
        self.list = list
    }
    
    
    class func allCategories() -> Array<Category> {
        return [ Category(title: "Private", image: UIImage(named: "private.png"), list:[]),
            Category(title: "Work", image: UIImage(named: "work.png"), list: []),
            Category(title: "School",  image: UIImage(named: "school.png"), list:[]),
            Category(title: "Birthday", image: UIImage(named: "birthday.png"), list: []),
            Category(title: "Holiday", image: UIImage(named: "holiday.png"), list: []),
            Category(title: "Anniversary",  image: UIImage(named: "anniversary.png"), list: [])]
    }
    
    class func categoryTags() -> [String] {
        let privateTag = CategoryTag.Private.rawValue
        let workTag = CategoryTag.Work.rawValue
        let schoolTag = CategoryTag.School.rawValue
        let birthdayTag = CategoryTag.Birthday.rawValue
        let holidayTag = CategoryTag.Holiday.rawValue
        let anniversaryTag = CategoryTag.Anniversary.rawValue

        return [privateTag, workTag, schoolTag, birthdayTag, holidayTag, anniversaryTag]
    }
}
