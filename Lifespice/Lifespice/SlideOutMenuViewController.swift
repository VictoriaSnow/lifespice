//
//  SlideOutMenuViewController.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/12/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

//import Foundation
import UIKit


//@objc
protocol SlideOutMenuViewControllerDelegate {
    func itemSelected(menuItem: MenuModel)
}

class SlideOutMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var overlayView: UIView!
    
    
    var delegate: SlideOutMenuViewControllerDelegate?
    
//    var items: [MenuModel]!
    let items = MenuModel.allMenuItems()
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
        tableView.rowHeight = 44
        
//        overlayView.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        overlayView.backgroundColor = UIColor.clearColor()
//        let item1 = MenuModel(title: "Home", icon: "icon-home", count: "14")
//        let item2 = MenuModel(title: "Categories", icon: "icon-categories", count: "3")
//        let item3 = MenuModel(title: "Important", icon: "icon-important", count: "2")
//        let item4 = MenuModel(title: "Settings", icon: "icon-settings")
//        let item5 = MenuModel(title: "Help", icon: "icon-help")
//        let item6 = MenuModel(title: "Sign out", icon: "icon-signout")
//        
//        items = [item1, item2, item3, item4, item5, item6]
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as MenuCell
        
        let item = items[indexPath.row]
        cell.titleLabel.text = item.title
        cell.countLabel.text = item.count
        cell.iconImageView.image = UIImage(named: item.icon)
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}

//class MenuModel {
//    var title : String!
//    var icon : String!
//    var count : String?
//    
//    init(title: String, icon : String){
//        self.title = title
//        self.icon = icon
//    }
//    
//    init(title: String, icon : String, count: String){
//        
//        self.title = title
//        self.icon = icon
//        self.count = count
//    }
//    class func allMenuItems() -> Array<MenuModel> {
//        return items
//    }
//}