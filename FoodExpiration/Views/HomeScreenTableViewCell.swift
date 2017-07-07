//
//  HomeScreenTableViewCell.swift
//  FoodExpiration
//
//  Created by apple on 7/5/17.
//  Copyright © 2017 Sylvia+Alan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class HomeScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var dateExpiryLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    @IBAction func unwindToHomeScreenViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
    
    
}
