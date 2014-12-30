//
//  AddItemViewController.swift
//  Ya
//
//  Created by Victoria Bian on 12/2/14.
//  Copyright (c) 2014 Lifespice. All rights reserved.
//

import UIKit
import CoreData

class AddItemViewController: UITableViewController {

   
    @IBOutlet var textFieldTitle: UITextField!
    @IBOutlet var textFieldLocation: UITextField!
    
    @IBOutlet weak var textFieldDate: UITextField!
    
    func handleDatePicker(sender: UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        textFieldDate.text = dateFormatter.stringFromDate(sender.date)
    }
   
    @IBAction func dateDis(sender: UITextField) {
        var datePickerView : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents:UIControlEvents.ValueChanged)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let now = NSDate()
        //dateAdd.minimumDate = now
        //dateAdd.hidden = true
        
        // Do any additional setup after loading the view.
//                self.tableView.backgroundView = UIImageView(image: UIImage(named: "new_york"))
    }
    
    
    
    @IBAction func doneTapped(sender: AnyObject) {
                // Reference to our app delegate
        
                let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
                // Reference moc
        
                let contxt: NSManagedObjectContext = appDel.managedObjectContext!
                let en = NSEntityDescription.entityForName("List", inManagedObjectContext: contxt)
        
                // Create instance of our data model and intitialize
        
                var newItem = Model(entity: en!, insertIntoManagedObjectContext: contxt)
        
                // Map our properties
        
                newItem.title = textFieldTitle.text
                newItem.location = textFieldLocation.text
        
                newItem.date = textFieldDate.text
                //                newItem.info = textFieldInfo.text
        
                // Save our context
                contxt.save(nil)
//                println(newItem.title)
//                println(newItem.location)
//                println(newItem.info)
        
                // Navigate back to root view controller
                
                self.navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func cancelTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func convertDate(date:NSDate)-> String {
        let dateFormatter = NSDateFormatter()
        return dateFormatter.stringFromDate(date)
        
    }

   

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
