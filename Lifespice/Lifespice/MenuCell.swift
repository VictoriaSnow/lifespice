//
//  MenuCell.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/12/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = UIFont(name: "Avenir-Next", size: 16)
//        titleLabel.textColor = UIColor.whiteColor()
        
        countLabel.font = UIFont(name: "Avenir-Next", size: 13)
//        countLabel.textColor = UIColor.whiteColor()
        
        //        countContainer.backgroundColor = UIColor(red: 0.33, green: 0.62, blue: 0.94, alpha: 1.0)
        //        countContainer.layer.cornerRadius = 15
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        let countNotAvailable = countLabel.text == nil
        
        //        countContainer.hidden = countNotAvailable
        countLabel.hidden = countNotAvailable
    }
    
}
