//
//  NewEventViewController.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/3/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit
import CoreData

class NewEventViewController: UITableViewController {

    @IBOutlet weak var textFieldTitle: UITextField!
    
    
    @IBOutlet weak var detailDate: UILabel!
    
    
    @IBOutlet weak var detailCategory: UILabel!
    
    
    @IBOutlet weak var detailReminder: UILabel!
    
    
    @IBOutlet weak var detailRepeat: UILabel!
    

    @IBOutlet weak var switchImportant: UISwitch!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        initDetailLabel()

        
        
        
    }
    
    func initDetailLabel() {
        // Date detail label
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let today = formatter.stringFromDate(date)
        detailDate.text = today
        // Category detail label
        // Reminder detail label
        var reminderDetail = Reminder()
        detailReminder.text = reminderDetail.rawValue
        //Repeat detail label
        var repeatDetail = Repeat()
        detailRepeat.text = repeatDetail.rawValue
        
    }
    
    @IBAction func endEditing(sender: UITextField) {
        self.resignFirstResponder()
    }
    @IBAction func doneTapped(sender: AnyObject) {
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Event", inManagedObjectContext: context)
        var newEvent = Model(entity: entity!, insertIntoManagedObjectContext: context)
        newEvent.eventTitle = textFieldTitle.text
//        newEvent.eventDate = detailDate
//        newEvent.eventCategory = detailCategory
        newEvent.eventReminder = detailReminder.text!
        newEvent.eventRepeat = detailRepeat.text!
        if switchImportant.on {
            newEvent.eventImportant = "YES"
        } else {
            newEvent.eventImportant = "NO"
        }
        
        context.save(nil)
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    @IBAction func cancelTapped(sender: AnyObject) {
                self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 0
//    }

    
    
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

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
