//
//  InviteFriendsViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/19.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class InviteFriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var friendsTableView: UITableView!
    
    let friendsImageArray = ["BE", "GE"]
    let friendsNameArray = ["Bernard" ,"George"]
    var friendInArray = [false, false]
    
    @IBAction func addFriend(_ sender: Any) {
        
        // Get indexPath
        var cell = (sender as AnyObject).superview
        while cell is UITableViewCell == false {
            cell = cell??.superview
        }
        let targetCell = cell as! InviteFriendTableViewCell
        
        if let indexPath = self.friendsTableView.indexPath(for: targetCell) {
            if friendInArray[indexPath.row] {
                targetCell.addFriendButton.setImage(#imageLiteral(resourceName: "addFriend"), for: .normal)
                friendInArray[indexPath.row] = false
            } else {
                targetCell.addFriendButton.setImage(#imageLiteral(resourceName: "checkBlack"), for: .normal)
                friendInArray[indexPath.row] = true
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
        return 2
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
