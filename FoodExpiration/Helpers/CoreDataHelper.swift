//
//  CoreDataHelper.swift
//  FoodExpiration
//
//  Created by apple on 7/5/17.
//  Copyright © 2017 Sylvia+Alan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    static func newFood() -> Food {
        let food = NSEntityDescription.insertNewObject(forEntityName: "Food", into: managedContext) as! Food
        return food
    }
    static func saveFood() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    static func delete(food: Food) {
        managedContext.delete(food)
        saveFood()
    }
    static func retrieveFoods() -> [Food] {
        let fetchRequest = NSFetchRequest<Food>(entityName: "Food")
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        return []
    }
}
