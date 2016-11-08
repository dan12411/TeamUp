//
//  ViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/4.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!

    var goals: [goal] = []
    var ref: FIRDatabaseReference!
//    let goals: [goal] = [
//        goal(image:"Hunter.jpg", goalTitle: "熱血健身", restNum: 36, memberNum: 6, continNum: 24),
//        goal(image:"OnePiece.jpg", goalTitle: "讀書會", restNum: 19, memberNum: 5, continNum: 52),
//        goal(image:"Avengers.jpg", goalTitle: "余憶少年時", restNum: 39, memberNum: 7, continNum: 56)
//        ]

    @IBOutlet weak var goalTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference(withPath: "TeamUp-goals")
        
        //MARK: - Retrieving Data (取得資料!!)
        // 1. Attach a listener to receive updates
        ref.observe(.value, with: { snapshot in
            // 2. Store the latest version of the data in a local variable
            var newItems: [goal] = []
            
            // 3. loop through the grocery items
            for item in snapshot.children {
                // 4.
                let goalItem = goal(snapshot: item as! FIRDataSnapshot)
                newItems.append(goalItem)
            }
            // 5. Reassign items to the latest version of the data
            self.goals = newItems
            self.goalTableView.reloadData()
        })
        
        // 顯示使用者名稱、頭像
        self.userName.text = "Aragaki Yui"
        self.userImage.image = UIImage(named: "gakki")
        
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - TableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        
        cell.goalImageView.image = UIImage(named: goals[indexPath.row].image)
        cell.goalTitle.text = goals[indexPath.row].goalTitle
        cell.memberNum.text = String(describing: goals[indexPath.row].memberNum)
        cell.restNum.text = String(describing: goals[indexPath.row].restNum)
        cell.continNum.text = String(describing: goals[indexPath.row].continNum)
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

