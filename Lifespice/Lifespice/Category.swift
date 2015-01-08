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
    
    let title: String
    let image: UIImage?
    let count: [String]
    
    init(title: String, image: UIImage?, count: [String]) {
        self.title = title
        self.image = image
        self.count = count
    }
    
    class func allCategories() -> Array<Category> {
        return [ Category(title: "Private", image: UIImage(named: "private.png"), count:[]),
            Category(title: "Work", image: UIImage(named: "work.png"), count: []),
            Category(title: "Birthday", image: UIImage(named: "birthday.png"), count: []),
            Category(title: "Anniversary",  image: UIImage(named: "anniversary.png"), count: []),
            Category(title: "Home",  image: UIImage(named: "home.png"), count: []),
            Category(title: "School",  image: UIImage(named: "school.png"), count:[])]
    }
}
