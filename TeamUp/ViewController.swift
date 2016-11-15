//
//  ViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/4.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit
import Firebase
import pop

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var addGoalButton: UIButton!
    
    var goals: [Goal] = []
    var ref: FIRDatabaseReference!
//    let goals: [goal] = [
//        goal(image:"Hunter.jpg", goalTitle: "熱血健身", restNum: 36, memberNum: 6, continNum: 24),
//        goal(image:"OnePiece.jpg", goalTitle: "讀書會", restNum: 19, memberNum: 5, continNum: 52),
//        goal(image:"Avengers.jpg", goalTitle: "余憶少年時", restNum: 39, memberNum: 7, continNum: 56)
//        ]

    @IBOutlet weak var goalTableView: UITableView!
    
    // POP for animation
    func spring() {
        if let animation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY) {
            animation.toValue = NSValue(cgSize: CGSize(width: 1.2, height: 1.2))
            
            animation.springBounciness = 10 //[0-20] 弹力 越大则震动幅度越大
            animation.springSpeed = 20 //[0-20] 速度 越大则动画结束越快
            animation.autoreverses = true
            
            addGoalButton.layer.pop_add(animation, forKey: "spring")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        spring()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let barFont = UIFont(name: "SignPainter", size: 30.0) {
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white, NSFontAttributeName:barFont]
        }
        
        // Remove the separators of the empty rows
        goalTableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Change the color of the separator
        goalTableView.separatorColor = UIColor.clear
        
        ref = FIRDatabase.database().reference(withPath: "TeamUp-goals")
        
        //MARK: - Retrieving Data (取得資料!!)
        // 1. Attach a listener to receive updates
        ref.observe(.value, with: { snapshot in
            // 2. Store the latest version of the data in a local variable
            var newItems: [Goal] = []
            
            // 3. loop through the grocery items
            for item in snapshot.children {
                // 4.
                let goalItem = Goal(snapshot: item as! FIRDataSnapshot)
                newItems.append(goalItem)
            }
            // 5. Reassign items to the latest version of the data
            self.goals = newItems
            self.goalTableView.reloadData()
        })
        
        //MARK: - Sorting the Grocery List(排序資料!!)
        // call queryOrdered(byChild:) on the Firebase reference, which takes a key to order by.
        ref?.queryOrdered(byChild: "createdAt").observe(.value, with: { snapshot in
            var newItems: [Goal] = []
            
            for item in snapshot.children {
                let goalItem = Goal(snapshot: item as! FIRDataSnapshot)
                newItems.append(goalItem)
            }
            
            self.goals = newItems
            self.goals = self.goals.reversed()
            self.goalTableView.reloadData()
        })
        
        // 顯示使用者名稱、頭像
        self.userName.text = "洪德晟"
        self.userImage.image = UIImage(named: "TC")
        
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
        cell.memberNum.text = String(describing: goals[indexPath.row].memberNum) + "人"
        cell.restNum.text = String(describing: goals[indexPath.row].restNum) + "天"
        cell.continNum.text = String(describing: goals[indexPath.row].continNum) + "次"
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "openDetail" {
            
            // Get the destination view controller
            let dvc = segue.destination as! EachGoalViewController
            
            // Get user selected index path
            let indexPath = self.goalTableView.indexPathForSelectedRow!
            
            // Get data
            let userName = self.userName.text
            
            // Put into next ViewController property
            dvc.userName = userName
            dvc.goal = goals[indexPath.row]
        }
    }
}

