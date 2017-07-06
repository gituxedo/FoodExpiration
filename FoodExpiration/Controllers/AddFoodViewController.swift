//
//  AddFoodViewController.swift
//  FoodExpiration
//
//  Created by apple on 7/5/17.
//  Copyright © 2017 Sylvia+Alan. All rights reserved.
//

import Foundation
import UIKit

class AddFoodViewController: UIViewController {
    
    var food: Food?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var foodNameTextField: UITextField!
    @IBOutlet weak var foodCategoryTextField: UITextField!
    
    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "cancel", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Cancel button tapped")
            } else if identifier == "save" {
                print("Save button tapped")
                let food = self.food ?? CoreDataHelper.newFood()
                food.name = foodNameTextField.text ?? ""
                food.category = foodCategoryTextField.text ?? ""
                food.dateExpiry = Date() as NSDate
                CoreDataHelper.saveFood()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let food = food {
            foodNameTextField.text = food.name
            foodCategoryTextField.text = food.category
        } else {
            foodNameTextField.text = ""
            foodCategoryTextField.text = ""
        }
    }
}
