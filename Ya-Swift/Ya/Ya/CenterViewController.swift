//
//  CenterViewController.swift
//  Ya
//
//  Created by Victoria Bian on 12/2/14.
//  Copyright (c) 2014 Lifespice. All rights reserved.
//

import UIKit
import CoreData

@objc

protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UITableViewController, SidePanelViewControllerDelegate {
    

    @IBOutlet weak private var imageView: UIImageView!

    @IBOutlet weak var titleLabel: UINavigationItem!

    
    var delegate: CenterViewControllerDelegate?
    
    var myList : Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 70
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "new_york"))
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var nav = self.navigationController?.navigationBar
        nav?.backgroundColor = UIColor.clearColor()
//        nav?.barStyle = UIBarStyle.BlackTranslucent
//        nav?.tintColor = UIColor.whiteColor()
//        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.orangeColor()]
    }
    
    override func viewDidAppear(animated: Bool) {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let freq = NSFetchRequest(entityName: "List")
        
        myList = context.executeFetchRequest(freq, error: nil)!
        tableView.reloadData()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Button actions

    
    @IBAction func categoriesTapped(sender: AnyObject) {
    

        delegate?.toggleLeftPanel?()
    }
    
    func categorySelected(category: Category) {
//        imageView.image = category.image
        titleLabel.title = category.title
        
        delegate?.collapseSidePanels?()
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return myList.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        


        // Configure the cell...
        let CellID: NSString = "Cell"
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellID) as UITableViewCell
        let ip = indexPath
        
        var data: NSManagedObject = myList[ip.row] as NSManagedObject
        
        cell.textLabel?.text = data.valueForKeyPath("title") as? String
        var loc = data.valueForKeyPath("location") as String
        var inf = data.valueForKeyPath("info") as String
        cell.detailTextLabel?.text = "\(loc)"
////        if (indexPath.row % 2 == 0) {
////            cell.backgroundColor = UIColor.clearColor()
////        } else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.9)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
            cell.detailTextLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
////        }
//        cell.textLabel?.textColor = UIColor.whiteColor()
//        cell.detailTextLabel?.textColor = UIColor.whiteColor()
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
    }



    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
