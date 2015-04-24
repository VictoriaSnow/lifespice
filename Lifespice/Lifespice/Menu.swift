//
//  MenuModel.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/13/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit

@objc
class Menu {
    var title : String!
    var icon : String!
    var count : String?
    

    
    init(title: String, icon : String){
        self.title = title
        self.icon = icon
    }
    
    init(title: String, icon : String, count: String){
        
        self.title = title
        self.icon = icon
        self.count = count
    }
    class func allMenuItems() -> Array<Menu> {
        var items: [Menu]!
        let item1 = Menu(title: "Home", icon: "icon-home", count: "14")
        let item2 = Menu(title: "Categories", icon: "icon-categories", count: "3")
        let item3 = Menu(title: "Important", icon: "icon-important", count: "2")
        let item4 = Menu(title: "Settings", icon: "icon-settings")
        let item5 = Menu(title: "Help", icon: "icon-help")
        let item6 = Menu(title: "Sign out", icon: "icon-signout")
        
        items = [item1, item2, item3, item4, item5, item6]
        return items
    }
}
