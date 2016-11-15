//
//  EachGoalViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/10.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit
import pop

class EachGoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    var goal: Goal?
    @IBOutlet weak var eachGoalTableView: UITableView!
    @IBOutlet weak var restDayLabel: UILabel!
    @IBOutlet weak var memberNumLabel: UILabel!
    @IBOutlet weak var goalListLabel: UILabel!
    @IBOutlet weak var animationForCheck: UIView!
    @IBOutlet weak var checkButton: DOFavoriteButton!
    var userName: String?
    let myGreenColor = UIColor(red: 123.0/255.0, green: 185.0/255.0, blue: 91.0/255.0, alpha: 1.0)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        springForButton()
    }
    
    @IBAction func checkAction(_ sender: DOFavoriteButton) {
        
        springForCheck()
        
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
    
    // POP for animation
    func springForCheck() {
        if let animation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY) {
            animation.toValue = NSValue(cgSize: CGSize(width: 1.02, height: 1.02))
            
            animation.springBounciness = 20//[0-20] 弹力 越大则震动幅度越大
            animation.springSpeed = 20 //[0-20] 速度 越大则动画结束越快
            animation.autoreverses = true
            
        animationForCheck.layer.pop_add(animation, forKey: "springColor")
        }
    }
    
    // POP for animation
    func springForButton() {
        if let animation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY) {
            animation.toValue = NSValue(cgSize: CGSize(width: 1.3, height: 1.3))
            
            animation.springBounciness = 20 //[0-20] 弹力 越大则震动幅度越大
            animation.springSpeed = 13 //[0-20] 速度 越大则动画结束越快
            animation.autoreverses = true
            
            checkButton.layer.pop_add(animation, forKey: "springColor")
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
            // custom friends
            cell.userImage.image = UIImage(named: "Man")
            cell.userNameLabel.text = "金城武"
            cell.userBestContiDays.text = "30"
            cell.userCurrentDays.text = "9"
            cell.goalProgress.progress = 0.3
            cell.reactionSummary.reactions = [Reaction.facebook.angry, Reaction.facebook.sad]
            return cell
            
        } else {
            // custom friends
            cell.userImage.image = UIImage(named: "gakki")
            cell.userNameLabel.text = "新垣結衣"
            cell.userBestContiDays.text = "30"
            cell.userCurrentDays.text = "15"
            cell.goalProgress.progress = 0.5
            cell.reactionSummary.reactions = [Reaction.facebook.like, Reaction.facebook.love]
            
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
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editGoal" {
            if let dvc = segue.destination as? MyNavigationController {
                dvc.goal = goal
            }
        }

    }
 
    

}
