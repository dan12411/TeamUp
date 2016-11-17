//
//  EachGoalViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/10.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit
import pop
import AVFoundation
import UserNotifications

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
    
    var reactionOne = [Reaction.facebook.angry]
    var reactionTwo = [Reaction.facebook.love]
    var reactionDefault =  [[Reaction]](repeating: [], count: 5)
    let usersBestDay = [89, 40, 60]
    
    var myPlayer: AVAudioPlayer?
    
    // 大家完成目標後的提示
    @IBAction func finishGoal(_ sender: Any) {
        let alert = UIAlertController(title: "恭喜您！", message: "🏅Demo Day 目標達成!  🎉", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // 選完表情按鈕
    @IBAction func pressLike(_ sender: ReactionButton!) {
        // Get indexPath
        var cell = (sender as AnyObject).superview
        while cell is UITableViewCell == false {
            cell = cell??.superview
        }
        let targetCell = cell as! UITableViewCell
        
        if let indexPath = self.eachGoalTableView.indexPath(for: targetCell) {
            if sender.isSelected {
                // Add Reactions
                    reactionDefault[indexPath.row].append(sender.reaction)
                    eachGoalTableView.reloadData()
            }
        }
    }
    
    // 讓 check 按鈕跳動
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        springForButton()
    }
    
    //MARK: - 確認完成按鈕
    // user按下確認鈕的動作
    @IBAction func checkAction(_ sender: DOFavoriteButton) {
        
        // Animation for table
        springForCheck()
        
        // Audio
        myPlayer?.stop()
        myPlayer?.currentTime = 0
        myPlayer?.play()
        
        // Notification
        let content = UNMutableNotificationContent()
        content.title = "恭喜"
        content.body = "您已完成今日的目標"
        content.sound = UNNotificationSound.default()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        let cell = eachGoalTableView.cellForRow(at: [0,0]) as! EachGoalTableViewCell
        
        func checked() {
            // for checked
            cell.userNameLabel.textColor = myGreenColor
            cell.bestContiDays.textColor = myGreenColor
            cell.currentDays.textColor = myGreenColor
            cell.userCurrentDays.textColor = myGreenColor
            cell.userBestContiDays.textColor = myGreenColor
            cell.goalProgress.progressTintColor = myGreenColor
            cell.goalProgress.trackTintColor = UIColor(red: 74.0/255.0, green: 107.0/255.0, blue: 58.0/255.0, alpha: 1.0)
            cell.checkImage.isHidden = false
        }
        
        func unChecked() {
            cell.userNameLabel.textColor = UIColor.darkGray
            cell.bestContiDays.textColor = UIColor.darkGray
            cell.currentDays.textColor = UIColor.darkGray
            cell.userCurrentDays.textColor = UIColor.darkGray
            cell.userBestContiDays.textColor = UIColor.darkGray
            cell.goalProgress.progressTintColor = UIColor.lightGray
            cell.goalProgress.trackTintColor = UIColor.darkGray
            cell.checkImage.isHidden = true
        }
        
        if sender.isSelected {
            unChecked()
            // deselect
            sender.deselect()
        } else {
            checked()
            // select with animation
            sender.select()
        }
    }
    
    // 其他user按下確認鈕的動作
    @IBAction func usersForCheck(_ sender: Any) {
        
        // Animation for table
        springForCheck()
        
        // Audio
        myPlayer?.stop()
        myPlayer?.currentTime = 0
        myPlayer?.play()
        
        // Get indexPath
        var cell = (sender as AnyObject).superview
        while cell is UITableViewCell == false {
            cell = cell??.superview
        }
        let targetCell = cell as! EachGoalTableViewCell
        
        if let indexPath = self.eachGoalTableView.indexPath(for: targetCell) {
            
            // Notification
            let content = UNMutableNotificationContent()
            content.title = "通知"
            if indexPath.row == 0 { return } else {
                content.body = "\((goal?.usersName?[indexPath.row - 1])!)已完成今日的目標"
                content.sound = UNNotificationSound.default()
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
            
            func checked() {
                // for checked
                targetCell.userNameLabel.textColor = myGreenColor
                targetCell.bestContiDays.textColor = myGreenColor
                targetCell.currentDays.textColor = myGreenColor
                targetCell.userCurrentDays.textColor = myGreenColor
                targetCell.userBestContiDays.textColor = myGreenColor
                targetCell.goalProgress.progressTintColor = myGreenColor
                targetCell.goalProgress.trackTintColor = UIColor(red: 74.0/255.0, green: 107.0/255.0, blue: 58.0/255.0, alpha: 1.0)
                targetCell.checkImage.isHidden = false
            }
            
            // For cheange
            checked()
            
        }
        
    }
    
    // POP for animation
    func springForCheck() {
        if let animation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY) {
            animation.toValue = NSValue(cgSize: CGSize(width: 1.02, height: 1.02))
            
            animation.springBounciness = 15 //[0-20] 弹力 越大则震动幅度越大
            animation.springSpeed = 20 //[0-20] 速度 越大则动画结束越快
            animation.autoreverses = true
            
//        animationForCheck.layer.pop_add(animation, forKey: "springForCheck")
        eachGoalTableView.layer.pop_add(animation, forKey: "TableMove")
        }
    }
    
    // POP for animation
    func springForButton() {
        if let animation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY) {
            animation.toValue = NSValue(cgSize: CGSize(width: 1.3, height: 1.3))
            
            animation.springBounciness = 20 //[0-20] 弹力 越大则震动幅度越大
            animation.springSpeed = 13 //[0-20] 速度 越大则动画结束越快
            animation.autoreverses = true
            
            checkButton.layer.pop_add(animation, forKey: "springForButton")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For Audio
        if let path = Bundle.main.path(forResource: "Coin", ofType: "mp3") {
            
            let audioURL = URL(fileURLWithPath: path)
            
            do {
                myPlayer = try AVAudioPlayer(contentsOf: audioURL)
                
            } catch {
                print("🚫 Something Wrong! 🚫")
            }
        }

        
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
        
        if let goal = goal, let userImage = goal.usersImage {
            return (userImage.count + 1)
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EachGoalTableViewCell
        
        cell.goalProgress.transform = CGAffineTransform(scaleX: 1, y: 5)
        cell.reactionSummary.reactions = reactionDefault[indexPath.row]
      
        
        if indexPath.row == 0 {
            cell.userImage.image = UIImage(named: "User")
            cell.userNameLabel.text = "張豪歐(Web)"
            cell.userBestContiDays.text = "89"
            cell.userCurrentDays.text = "89"
            cell.goalProgress.progress = 1
            cell.masterImage.isHidden = false
            return cell
            
        } else {
            cell.userImage.image = UIImage(named: (goal?.usersImage?[indexPath.row - 1])!)
            cell.userNameLabel.text = goal?.usersName?[indexPath.row - 1]
            cell.userBestContiDays.text = goal?.userBestContiDays?[indexPath.row - 1]
            cell.userCurrentDays.text = String(usersBestDay[indexPath.row - 1])
            cell.goalProgress.progress = (goal?.goalProgress?[indexPath.row - 1])!
            return cell
        }
        

//            // checked 1st checker
//            cell.masterImage.image = UIImage(named: "Badge")
//            cell.masterImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            cell.masterImage.isHidden = false
            
            
            return cell
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
 
