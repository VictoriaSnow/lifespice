//
//  SetReminderViewController.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/8/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit

@objc



class SetReminderViewController: UITableViewController {
    

    let reminders = Reminder.allReminders()

    var selectedReminderType: String? = nil
    var selectedReminderIndex: Int? = nil
    var selectedReminder = Reminder(title: "None");

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if let reminder = selectedReminderType {
            selectedReminderIndex = find(["None", "1 day until", "2 days until", "3 days until", "1 week until"], reminder)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return reminders.count
    }


    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReminderCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = reminders[indexPath.row].title
        
        if indexPath.row == selectedReminderIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }

        return cell
    }

//    @IBAction func backToNewEventViewController(segue: UIStoryboardSegue) {
//        dismissViewControllerAnimated(true, completion: nil)
//    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        
        //Other row is selected - need to deselect it
        if let index = selectedReminderIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedReminder = reminders[indexPath.row]
        selectedReminderIndex = indexPath.row
        selectedReminderType = reminders[indexPath.row].title
        
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "SaveSelectedReminder" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            selectedReminderIndex = indexPath?.row
            if let index = selectedReminderIndex {
                selectedReminder = reminders[index]
                selectedReminderType = reminders[index].title
            }
            
        }
    }


}
