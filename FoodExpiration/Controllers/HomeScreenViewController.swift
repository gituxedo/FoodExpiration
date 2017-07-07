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
        foods = bubble(dates:&foods)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    
    // 2
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        foods = bubble(dates:&foods)
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeScreenTableViewCell", for: indexPath) as! HomeScreenTableViewCell
        let row = indexPath.row
        let food = foods[row]
        cell.foodLabel.text = food.name
        cell.dateExpiryLabel.text = "\(Int(0.5 + past(time: food.dateExpiry!))) days"
        cell.dateExpiryLabel.textColor = .black
        cell.dateExpiryLabel.backgroundColor = .white
        if past(time: food.dateExpiry!) < 0.5 {
            cell.dateExpiryLabel.text = "EXPIRED"
            cell.dateExpiryLabel.textColor = .white
            cell.dateExpiryLabel.backgroundColor = .red
        } else if past(time: food.dateExpiry!) < 3 {
            cell.dateExpiryLabel.backgroundColor = .orange
        } else if past(time: food.dateExpiry!) < 7 {
            cell.dateExpiryLabel.backgroundColor = .yellow
        } else {
            cell.dateExpiryLabel.backgroundColor = .green
        }
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
        self.foods = CoreDataHelper.retrieveFoods()
    }
    
    func find(arr: [Food], item:Food) -> Int {
        var count:Int = 0
        for i in arr {
            if i == item {
                return count
            }; count += 1
        }; return -1
    }
    
    public func bubble(dates: inout [Food]) -> [Food] {
        for i in (0..<dates.count).reversed() {
            for j in 0..<i where dates[j].dateExpiry! > dates[j + 1].dateExpiry! {
                swap(&dates[j], &dates[j + 1])
            }
        }; return dates
    }
}
