//
//  InviteFriendsViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/19.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit
import UserNotifications
import Material

class InviteFriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var friendsTableView: UITableView!
    
    let friendsImageArray = ["BE", "GE", "Hung", "Justin", "Ollie", "Denny", "Howard", "Jacob", "Pampas", "PCboy", "HEROGWP"]
    let friendsNameArray = ["Bernard" ,"George", "Hung", "Justin", "Ollie", "Denny", "Howard", "Jacob", "Pampas", "PCboy", "HERPOWP"]
    var friendInArray = [false, false, false, false, false, false, false, false, false, false, false]
    
    // 按下加入的按鈕
    @IBAction func addFriend(_ sender: Any) {
        
        // Get indexPath
        var cell = (sender as AnyObject).superview
        while cell is UITableViewCell == false {
            cell = cell??.superview
        }
        let targetCell = cell as! InviteFriendTableViewCell
        
        if let indexPath = self.friendsTableView.indexPath(for: targetCell) {
            
            // Notification
            func notiForAddFriend() {
                let content = UNMutableNotificationContent()
                content.title = "通知"
                content.body = "您已邀請\(friendsNameArray[indexPath.row])加入"
                content.sound = UNNotificationSound.default()
                let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: nil)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
            
            if friendInArray[indexPath.row] {
                targetCell.addFriendButton.setImage(#imageLiteral(resourceName: "addFriend"), for: .normal)
                friendInArray[indexPath.row] = false
            } else {
                targetCell.addFriendButton.setImage(#imageLiteral(resourceName: "checkBlack"), for: .normal)
                friendInArray[indexPath.row] = true
                notiForAddFriend()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - TableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InviteFriendTableViewCell
        
        cell.friendsImage.image = UIImage(named: friendsImageArray[indexPath.row])
        cell.friendsNameLabel.text = friendsNameArray[indexPath.row]
        
        return cell
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
