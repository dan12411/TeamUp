//
//  CalendarViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/11.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController , FSCalendarDataSource, FSCalendarDelegate {
    
    private weak var calendar: FSCalendar!
    var dayOfTask: String?
    
    override func loadView() {
        
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.groupTableViewBackground
        self.view = view
        
        let calendar = FSCalendar(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: self.view.bounds.width, height: 280))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.backgroundColor = UIColor(red: 88.0/255.0, green: 171.0/255.0, blue: 206.0/255.0, alpha: 1.0)
        calendar.scopeGesture.isEnabled = false
        self.view.addSubview(calendar)
        self.calendar = calendar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FSCalendar"
        calendar.scope = .week
        calendar.appearance.headerDateFormat = "MMM yyyy"
        calendar.appearance.weekdayTextColor = UIColor.white
        calendar.appearance.headerTitleColor = UIColor.white
        calendar.appearance.titleDefaultColor = UIColor.white
//        calendar.appearance.headerTitleFont = UIFont(name: "Avenir", size: 7)
        calendar.appearance.titlePlaceholderColor = UIColor.white
        calendar.clipsToBounds = true
    }
    
    // Update your frame
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendar.frame = CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: bounds.width, height: bounds.height)
    }
    
    // FSCalendarDelegate
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let str = dateFormatter.string(from: date)
        let vc = navigationController?.parent as! EachGoalViewController
        
        if str == "21" {
            dayOfTask = "Fix BUG"
            vc.goalListLabel.text = dayOfTask
        } else if str == "22" {
            dayOfTask = "Final Project Rehearsal"
        } else if str == "23" {
            dayOfTask = "Demo Day"
        } else {
            dayOfTask = ""
        }
        
        vc.goalListLabel.text = dayOfTask
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


