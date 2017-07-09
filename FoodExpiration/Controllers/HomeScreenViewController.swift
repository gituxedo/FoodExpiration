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
        foods = bubble(foods:&foods)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeScreenTableViewCell", for: indexPath) as! HomeScreenTableViewCell
        let row = indexPath.row
        let food = foods[row]
        cell.foodLabel.text = food.name
        cell.dateExpiryLabel.text = "\(Int(0.5 + past(time: food.dateExpiry!))) days"
        cell.categoryLabel.text = food.category
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
        if editingStyle == .delete {
            CoreDataHelper.delete(food: foods[indexPath.row])
            foods = CoreDataHelper.retrieveFoods()
            foods = bubble(foods:&foods)
        }
    }
    
    @IBAction func unwindToHomeScreenViewController(_ segue: UIStoryboardSegue) {
        self.foods = CoreDataHelper.retrieveFoods()
        foods = bubble(foods:&foods)
    }
    
    public func bubble(foods: inout [Food]) -> [Food] {
        for i in (0..<foods.count).reversed() {
            for j in 0..<i where foods[j].dateExpiry! > foods[j + 1].dateExpiry! {
                swap(&foods[j], &foods[j + 1])
            }
        }; return foods
    }
}
