//
//  ShowItemViewController.swift
//  Ya
//
//  Created by Victoria Bian on 12/11/14.
//  Copyright (c) 2014 Lifespice. All rights reserved.
//


import UIKit
import CoreData

class ShowItemViewController: UIViewController {
    @IBOutlet weak var nameDis: UILabel!
    
    @IBOutlet weak var locationDis: UILabel!
    @IBOutlet weak var detailDis: UILabel!
    @IBAction func backTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
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

