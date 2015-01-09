//
//  Category.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/7/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit

@objc
class Category {
    enum CategoryTag: String {
        case Private = "Private", Work = "Work", Birthday = "Birthday", Anniversary = "Anniversary", Home = "Home", School = "School"
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
            Category(title: "Birthday", image: UIImage(named: "birthday.png"), list: []),
            Category(title: "Anniversary",  image: UIImage(named: "anniversary.png"), list: []),
            Category(title: "Home",  image: UIImage(named: "home.png"), list: []),
            Category(title: "School",  image: UIImage(named: "school.png"), list:[])]
    }
}
