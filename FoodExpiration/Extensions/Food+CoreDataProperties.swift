//
//  Food+CoreDataProperties.swift
//  
//
//  Created by apple on 7/6/17.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var category: String?
    @NSManaged public var dateExpiry: NSDate?
    @NSManaged public var name: String?

}
