//
//  SidePanelViewController.swift
//  Ya
//
//  Created by Victoria Bian on 12/11/14.
//  Copyright (c) 2014 Lifespice. All rights reserved.
//

import UIKit

@objc
protocol SidePanelViewControllerDelegate {
    func categorySelected(category: Category)
}

class SidePanelViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: SidePanelViewControllerDelegate?
    
    var categories: Array<Category>!
    
    struct TableView {
        struct CellIdentifiers {
            static let CategoryCell = "CategoryCell"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 45
        tableView.reloadData()
    }
    
    // MARK: Table View Data Source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.CategoryCell, forIndexPath: indexPath) as CategoryCell
        cell.configureForCategory(categories[indexPath.row])
        return cell
    }
    
    // Mark: Table View Delegate
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let selectedCategory = categories[indexPath.row]
        delegate?.categorySelected(selectedCategory)
    }
    
}

class CategoryCell: UITableViewCell {
    
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    func configureForCategory(category: Category) {
        categoryImageView.image = category.image
        categoryNameLabel.text = category.title

    }
}
