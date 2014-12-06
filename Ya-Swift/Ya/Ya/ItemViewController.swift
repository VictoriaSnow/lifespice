//
//  ItemViewController.swift
//  Ya
//
//  Created by Victoria Bian on 12/2/14.
//  Copyright (c) 2014 Lifespice. All rights reserved.
//

import UIKit
import CoreData

class ItemViewController: UIViewController {

    @IBOutlet var textFieldItem: UITextField!
    @IBOutlet var textFieldDate: UITextField!
    @IBOutlet var textFieldInfo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func updateDate(sender: AnyObject) {
        UIDatePicker *picker = (UIDatePicker*)textFieldDate.inputView;
        UIFieldDate.text = [NSString stringWithFormat:@ "%",picker.date]
    }

    @IBAction func saveTapped(sender: AnyObject) {
        // Reference to our app delegate
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        // Reference mac
        
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("List", inManagedObjectContext: contxt)
        
        // Create instance of pur data model and intitialize
        
        var newItem = Model(entity: en!, insertIntoManagedObjectContext: contxt)
        
        // Map our properties
        
        newItem.item = textFieldItem.text
        newItem.date = textFieldItem.text
        newItem.info = textFieldItem.text
        
        // Save our context
        contxt.save(nil)
        println(newItem)
        
        // Navigate back to root view controller
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
        
        
    }
    @IBAction func cancelTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
