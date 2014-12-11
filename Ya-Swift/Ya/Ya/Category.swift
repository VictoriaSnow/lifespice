//
//  Category.swift
//  Ya
//
//  Created by Victoria Bian on 12/11/14.
//  Copyright (c) 2014 Lifespice. All rights reserved.
//

import UIKit

@objc
class Category {
    
    let title: String
    let image: UIImage?
    
    init(title: String, image: UIImage?) {
        self.title = title

        self.image = image
    }
    
    class func allCategories() -> Array<Category> {
        return [ Category(title: "All", image: UIImage(named: "all.png")),
            Category(title: "Home", image: UIImage(named: "home.png")),
            Category(title: "Work", image: UIImage(named: "work.png")),
            Category(title: "School",  image: UIImage(named: "school.png")),
            Category(title: "Event",  image: UIImage(named: "event.png")),
            Category(title: "Birthday",  image: UIImage(named: "birthday.png")),
            Category(title: "Holiday", image: UIImage(named: "holiday.png")),
//            Category(title: "Others", image: UIImage(named: "more.png")),
            Category(title: "Add more",  image: UIImage(named: "add_more.png"))]
    }
}
