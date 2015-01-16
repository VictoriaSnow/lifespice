////
////  SlideOutMenuViewController.swift
////  Lifespice
////
////  Created by Victoria Bian on 1/12/15.
////  Copyright (c) 2015 Lifespice. All rights reserved.
////
//
//
//import UIKit
//
//
//@objc
//protocol SlideOutMenuViewControllerDelegate {
//    func menuItemSelected(menuItem: Menu)
//}
//
//class SlideOutMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    @IBOutlet weak var imageView: UIImageView!
//    
//    @IBOutlet weak var overlayView: UIView!
//    
//    
//    var delegate: SlideOutMenuViewControllerDelegate?
//    var menuItems: Array<Menu>!
//    
//    
//    func uicolorFromHex(rgbValue:UInt32)->UIColor{
//        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
//        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
//        let blue = CGFloat(rgbValue & 0xFF)/256.0
//        
//        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.backgroundColor = UIColor.clearColor()
//        tableView.rowHeight = 44
//        overlayView.backgroundColor = UIColor.clearColor()
//        tableView.reloadData()
//    }
//    
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        println(menuItems.count)
//        return menuItems.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as MenuCell
//        let item = menuItems[indexPath.row]
//        cell.titleLabel.text = item.title
//        cell.countLabel.text = item.count
//        cell.iconImageView.image = UIImage(named: item.icon)
//        cell.backgroundColor = UIColor.clearColor()
//        
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let selectedMenuItem = menuItems[indexPath.row]
//        println("did select")
//        delegate?.menuItemSelected(selectedMenuItem)
//        dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    
//    
//    
//    
//    
//    /*
//    // MARK: - Navigation
//    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    // Get the new view controller using segue.destinationViewController.
//    // Pass the selected object to the new view controller.
//    }
//    */
//    
//    
//}
//
////class MenuModel {
////    var title : String!
////    var icon : String!
////    var count : String?
////
////    init(title: String, icon : String){
////        self.title = title
////        self.icon = icon
////    }
////
////    init(title: String, icon : String, count: String){
////
////        self.title = title
////        self.icon = icon
////        self.count = count
////    }
////    class func allMenuItems() -> Array<MenuModel> {
////        return items
////    }
////}