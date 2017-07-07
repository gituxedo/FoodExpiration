//
//  DatePickerViewController.swift
//  FoodExpiration
//
//  Created by apple on 7/5/17.
//  Copyright © 2017 Sylvia+Alan. All rights reserved.
//

import Foundation
import UIKit

class DatePickerViewController: UIViewController {
    
    var strDate:String = ""
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        strDate = dateFormatter.string(from: datePicker.date)
        dateLabel.text = strDate
    }
    
    func returnDate() -> String {
        return strDate
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
