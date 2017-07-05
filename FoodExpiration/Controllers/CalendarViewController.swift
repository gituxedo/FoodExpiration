//
//  CalendarViewController.swift
//  FoodExpiration
//
//  Created by apple on 7/5/17.
//  Copyright © 2017 Sylvia+Alan. All rights reserved.
//

import Foundation
import UIKit
import CVCalendar

class CalendarViewController: UIViewController, CVCalendarViewDelegate, CVCalendarMenuViewDelegate, CVCalendarViewAppearanceDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        self.menuView = CVCalendarMenuView(frame: CGRect(x: 0, y: 0, width: 300, height: 15))
        
        // CVCalendarView initialization with frame
        self.calendarView = CVCalendarView(frame: CGRect(x: 0, y: 20, width: 300, height: 450))
        
        // Appearance delegate [Unnecessary]
        self.calendarView.calendarAppearanceDelegate = self
        
        // Animator delegate [Unnecessary]
        self.calendarView.animatorDelegate = self
        
        // Menu delegate [Required]
        self.menuView.menuViewDelegate = self
        
        // Calendar delegate [Required]
        self.calendarView.calendarDelegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }
    
    @IBOutlet weak var menuView: CVCalendarMenuView!
    
    @IBOutlet weak var calendarView: CVCalendarView!
    
    func presentationMode() -> CalendarMode{
        return .monthView
    }
    func firstWeekday() -> Weekday{
        return .monday
    }
}
