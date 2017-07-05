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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeScreenTableViewCell", for: indexPath) as! HomeScreenTableViewCell
        //let row = indexPath.row
        //cell.textLabel?.text = "your mum"
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
}
