//
//  ViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/4.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    let goals: [goal] = [
        goal(goalTitle: "熱血健身", restNum: 36, memberNum: 6, continNum: 24),
        goal(goalTitle: "讀書會", restNum: 19, memberNum: 5, continNum: 52)
        ]
    
    @IBOutlet weak var goalTableView: UITableView!

    // MARK: - TableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        
        cell.goalImageView.image = UIImage(named:"Hunter")
        cell.goalTitle.text = goals[indexPath.row].goalTitle
        cell.memberNum.text = String(describing: goals[indexPath.row].memberNum!)
        cell.restNum.text = String(describing: goals[indexPath.row].restNum!)
        cell.continNum.text = String(describing: goals[indexPath.row].continNum!)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 顯示使用者名稱、頭像
        self.userName.text = "Billy Hope"
        self.userImage.image = UIImage(named: "OnePiece")
        
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

