//
//  HomeScreenViewController.swift
//  FoodExpiration
//
//  Created by apple on 7/5/17.
//  Copyright © 2017 Sylvia+Alan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class HomeScreenViewController: UITableViewController {
    
    var foods = [Food]() {
        didSet { tableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foods = CoreDataHelper.retrieveFoods()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //foods.count
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeScreenTableViewCell", for: indexPath) as! HomeScreenTableViewCell
        cell.foodLabel.text = "food name"
        cell.dateExpiryLabel.text = "Date until expiry"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "settings" {
                print("settings button tapped")
            } else if identifier == "addFood" {
                print("+ button tapped")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 2
        if editingStyle == .delete {
            CoreDataHelper.delete(food: foods[indexPath.row])
            foods = CoreDataHelper.retrieveFoods()
        }
    }
    
    @IBAction func unwindToHomeScreenViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        self.foods = CoreDataHelper.retrieveFoods()
    }
}
