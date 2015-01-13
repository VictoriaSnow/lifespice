//
//  MenuModel.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/13/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit


class MenuModel {
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
    class func allMenuItems() -> Array<MenuModel> {
        var items: [MenuModel]!
        let item1 = MenuModel(title: "Home", icon: "icon-home", count: "14")
        let item2 = MenuModel(title: "Categories", icon: "icon-categories", count: "3")
        let item3 = MenuModel(title: "Important", icon: "icon-important", count: "2")
        let item4 = MenuModel(title: "Settings", icon: "icon-settings")
        let item5 = MenuModel(title: "Help", icon: "icon-help")
        let item6 = MenuModel(title: "Sign out", icon: "icon-signout")
        
        items = [item1, item2, item3, item4, item5, item6]
        return items
    }
}
