//
//  MasterViewController.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/3/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit
import CoreData

@objc

protocol MasterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate, SlideOutMenuViewControllerDelegate {

    var managedObjectContext: NSManagedObjectContext? = nil
    var delegate: MasterViewControllerDelegate?
    
    var allData: NSArray? = nil
    var filteredData: NSArray? = nil
    var searchIsActive: Bool = false

    @IBOutlet weak var menuItem: UIBarButtonItem!
    
    var transitionOperator = TransitionOperator()
    
    
    
    var searchResultsContext: NSManagedObjectContext? = nil

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.searchDisplayController?.searchResultsTableView.registerClass(CustomCell.self, forCellReuseIdentifier: "Cell")
        self.searchDisplayController?.searchResultsTableView.registerClass(CustomCell.self, forCellReuseIdentifier: "Cell")
        
        self.tableView.rowHeight = 60
        self.tableView.contentOffset = CGPointMake(0, self.searchBar.frame.size.height)
        allData = fetchedResultsController.fetchedObjects
        self.searchDisplayController?.searchResultsTableView.registerClass(CustomCell.self, forCellReuseIdentifier: "Cell")
        var nib = UINib(nibName: "CustomCell", bundle: nil)

        self.searchDisplayController!.searchResultsTableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        self.tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        tableView.reloadData()
//        self.filter("")

    }
    
    
    func filter(searchText: NSString) {
        
        var filteredPredicate: NSPredicate = NSPredicate(format: "eventTitle CONTAINS[c] %@", searchText)!
        filteredData = allData!.filteredArrayUsingPredicate(filteredPredicate)
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filter(searchString)
		return true
        
    }

    
    @IBAction func menuTapped(sender: AnyObject) {
        
        
        delegate?.toggleLeftPanel?()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func searchDisplayControllerDidBeginSearch(controller: UISearchDisplayController) {
        self.searchIsActive = true
        }
    
    func searchDisplayControllerWillEndSearch(controller: UISearchDisplayController) {
        self.searchIsActive = false
        }
    
    func itemSelected(menuItem: MenuModel) {
        delegate?.collapseSidePanels?()
        if (menuItem.title == "Important") {
            self.filterImportant()
        }
    }
    
    func filterImportant() {
        var importantPredicate: NSPredicate = NSPredicate(format: "eventImportant == true")!
        filteredData = allData!.filteredArrayUsingPredicate(importantPredicate)

    }
    
    @IBAction func cancelEvent(segue:UIStoryboardSegue) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveEvent(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
  
    // MARK: - Segues
    @IBAction func presentMenu(sender: AnyObject?){
        performSegueWithIdentifier("presentMenu", sender: self)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow() {
//            let event = self.fetchedResultsController.objectAtIndexPath(indexPath) as Event
//            (segue.destinationViewController as DetailViewController).detailItem = event
//            }
//        }
        if segue.identifier == "showDetail" {
            var destination: DetailViewController = segue.destinationViewController as DetailViewController
            
            if (searchIsActive) {
                if let indexPath = searchDisplayController?.searchResultsTableView.indexPathForSelectedRow() {
                    let event = self.filteredData!.objectAtIndex(indexPath.row) as Event
                    destination.detailItem = event
                }
            }else{
                if let indexPath = self.tableView.indexPathForSelectedRow() {
                    let event = self.fetchedResultsController.objectAtIndexPath(indexPath) as Event
                    destination.detailItem = event
                    
                }
                
            }
        }

        let toViewController = segue.destinationViewController as UIViewController
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
        toViewController.transitioningDelegate = self.transitionOperator
        
    }
    

    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var num: Int = 0
        if (searchIsActive) {
            num = filteredData!.count
            
            
        }else{
            
            let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
            num = sectionInfo.numberOfObjects
        }
        return num
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as CustomCell
//        self.configureCell(cell, atIndexPath: indexPath)
        allData = fetchedResultsController.fetchedObjects
        var event = allData?.objectAtIndex(indexPath.row) as Event
        if (searchIsActive) {
            event = filteredData!.objectAtIndex(indexPath.row) as Event
        }
        if event.eventTitle == "" {
            cell.cellTitleLabel.text = "Untitled Event"
        } else {
            cell.cellTitleLabel.text = event.eventTitle
            
        }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        dateFormatter.timeStyle = .NoStyle
        cell.cellDateLabel.text = dateFormatter.stringFromDate(event.eventDate)
        
        
        cell.cellImageView.image = UIImage(named: event.eventCategory + "@icon")
        
        var countdown:Int = cell.countdownDays(event.eventDate)
        cell.cellNumberLabel.text = toString(countdown)
        return cell
    }

    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let context = self.fetchedResultsController.managedObjectContext
            context.deleteObject(self.fetchedResultsController.objectAtIndexPath(indexPath) as NSManagedObject)
                
            var error: NSError? = nil
            if !context.save(&error) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                //println("Unresolved error \(error), \(error.userInfo)")
                abort()
            }
        }
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var detail: DetailViewController = DetailViewController()
        if (searchIsActive) {
            detail.detailItem = self.filteredData!.objectAtIndex(indexPath.row) as? Event
            self.performSegueWithIdentifier("showDetail", sender: self)
            
        }else{
            detail.detailItem = self.allData!.objectAtIndex(indexPath.row) as? Event
            self.performSegueWithIdentifier("showDetail", sender: self)
            
        }
    }
    

    
    // MARK: - Fetched results controller

    var fetchedResultsController: NSFetchedResultsController {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest = NSFetchRequest()
        // Edit the entity name as appropriate.
        let entity = NSEntityDescription.entityForName("Event", inManagedObjectContext: self.managedObjectContext!)
        fetchRequest.entity = entity
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "eventDate", ascending: true)
        let sortDescriptors = [sortDescriptor]
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
//        allData = self.managedObjectContext?.executeFetchRequest(fetchRequest, error: nil)
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: "Master")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
    	var error: NSError? = nil
    	if !_fetchedResultsController!.performFetch(&error) {
    	     // Replace this implementation with code to handle the error appropriately.
    	     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
             //println("Unresolved error \(error), \(error.userInfo)")
    	     abort()
    	}
        
        return _fetchedResultsController!
    }    
    var _fetchedResultsController: NSFetchedResultsController? = nil
    


    /*
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    */

    /*
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
            case .Insert:
                self.tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
            case .Delete:
                self.tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
            default:
                return
        }
    }
    */

    /*
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
            case .Insert:
                tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
            case .Delete:
                tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            case .Update:
                self.configureCell(tableView.cellForRowAtIndexPath(indexPath!)!, atIndexPath: indexPath!)
            case .Move:
                tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
                tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
            default:
                return
        }
    }
    */

    /*
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableView.endUpdates()
    }
    */

    
     // Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed.
     
     func controllerDidChangeContent(controller: NSFetchedResultsController) {
         // In the simplest, most efficient, case, reload the table view.
         self.tableView.reloadData()
     }


}

