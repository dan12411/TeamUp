//
//  EachGoalViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/10.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class EachGoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    var goal: Goal?
    @IBOutlet weak var eachGoalTableView: UITableView!
    @IBOutlet weak var restDayLabel: UILabel!
    @IBOutlet weak var memberNumLabel: UILabel!
    @IBOutlet weak var goalListLabel: UILabel!
    var userName: String?
    let myGreenColor = UIColor(red: 123.0/255.0, green: 185.0/255.0, blue: 91.0/255.0, alpha: 1.0)
    
    @IBAction func checkAction(_ sender: DOFavoriteButton) {
        
        let cell = eachGoalTableView.cellForRow(at: [0,0]) as! EachGoalTableViewCell
        
        if sender.isSelected {
            cell.userNameLabel.textColor = UIColor.darkGray
            cell.bestContiDays.textColor = UIColor.darkGray
            cell.currentDays.textColor = UIColor.darkGray
            cell.userCurrentDays.textColor = UIColor.darkGray
            cell.userBestContiDays.textColor = UIColor.darkGray
            cell.goalProgress.progressTintColor = UIColor.lightGray
            cell.goalProgress.trackTintColor = UIColor.darkGray
            cell.checkImage.isHidden = true
            // deselect
            sender.deselect()
        } else {
            cell.userNameLabel.textColor = myGreenColor
            cell.bestContiDays.textColor = myGreenColor
            cell.currentDays.textColor = myGreenColor
            cell.userCurrentDays.textColor = myGreenColor
            cell.userBestContiDays.textColor = myGreenColor
            cell.goalProgress.progressTintColor = myGreenColor
            cell.goalProgress.trackTintColor = UIColor(red: 74.0/255.0, green: 107.0/255.0, blue: 58.0/255.0, alpha: 1.0)
            cell.checkImage.isHidden = false
            // select with animation
            sender.select()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show label text content
        if let goal = goal {
            restDayLabel.text = String(describing: goal.restNum) + "天"
            memberNumLabel.text = String(describing: goal.memberNum) + "人"
            goalListLabel.text = goal.monGoal
        }

        // Remove the separators of the empty rows
        eachGoalTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Change the color of the separator
        eachGoalTableView.separatorColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - TableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EachGoalTableViewCell
        
        cell.goalProgress.transform = CGAffineTransform(scaleX: 1, y: 5)
        
        if indexPath.row == 0 {
            cell.userImage.image = UIImage(named: "TC")
            cell.userNameLabel.text = userName
            cell.userBestContiDays.text = "30"
            cell.userCurrentDays.text = "24"
            cell.goalProgress.progress = 0.8
            cell.masterImage.isHidden = false
            return cell
        } else if indexPath.row == 1  {
            cell.userImage.image = UIImage(named: "Man")
            cell.userNameLabel.text = "金城武"
            cell.userBestContiDays.text = "30"
            cell.userCurrentDays.text = "9"
            cell.goalProgress.progress = 0.3
            return cell
            
        } else {
            cell.userImage.image = UIImage(named: "gakki")
            cell.userNameLabel.text = "新垣結衣"
            cell.userBestContiDays.text = "30"
            cell.userCurrentDays.text = "15"
            cell.goalProgress.progress = 0.5
            
            // for checked
            cell.userNameLabel.textColor = myGreenColor
            cell.bestContiDays.textColor = myGreenColor
            cell.currentDays.textColor = myGreenColor
            cell.userCurrentDays.textColor = myGreenColor
            cell.userBestContiDays.textColor = myGreenColor
            cell.goalProgress.progressTintColor = myGreenColor
            cell.goalProgress.trackTintColor = UIColor(red: 74.0/255.0, green: 107.0/255.0, blue: 58.0/255.0, alpha: 1.0)
            cell.checkImage.isHidden = false
            // checked 1st checker
            cell.masterImage.image = UIImage(named: "Badge")
            cell.masterImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            cell.masterImage.isHidden = false
            
            
            return cell
        }
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
