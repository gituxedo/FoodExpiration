//
//  AddFoodViewController.swift
//  FoodExpiration
//
//  Created by apple on 7/5/17.
//  Copyright © 2017 Sylvia+Alan. All rights reserved.
//

import Foundation
import UIKit

class AddFoodViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var food: Food?
    var strDate:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        pickerData = ["Meat", "Dairy", "Vegetable", "Fruit", "Other"]
        
    }
    
    @IBOutlet weak var foodNameTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    var pickerData:[String] = [String]()
    
    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "cancel", sender: self)
    }
    
//    static func updateLabel(label: UILabel)->String {
//        let size = pickerData[categoryPicker.selectedRow(inComponent: 0)]
//        return size
//    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        strDate = dateFormatter.string(from: datePicker.date)
        dateLabel.text = strDate
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Cancel button tapped")
            } else if identifier == "save" {
                print("Save button tapped")
                let food = self.food ?? CoreDataHelper.newFood()
                food.name = foodNameTextField.text ?? ""
//                food.category = foodCategoryTextField.text ?? ""
                food.dateExpiry = datePicker.date as NSDate
//                food.category = pickerData[categoryPicker.selectedRow(inComponent: 0)]
                let homeScreenViewController = segue.destination as! HomeScreenViewController
                homeScreenViewController.foods.append(food)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let food = food {
            foodNameTextField.text = food.name
//            foodCategoryTextField.text = food.category
        } else {
            foodNameTextField.text = ""
//            foodCategoryTextField.text = ""
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

}
