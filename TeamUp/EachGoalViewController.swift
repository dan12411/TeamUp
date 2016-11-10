//
//  EachGoalViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/10.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class EachGoalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eachGoalTableView: UITableView!
    @IBOutlet weak var restDayLabel: UILabel!
    var restDay: String?
    @IBOutlet weak var memberNumLabel: UILabel!
    var memberNum: String?
    @IBOutlet weak var goalListLabel: UILabel!
    
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // show label text content
        if let text = restDay {
            restDayLabel.text = text
        }
        if let text = memberNum {
            memberNumLabel.text = text
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EachGoalTableViewCell
        
        cell.userImage.image = UIImage(named: "gakki")
        cell.userNameLabel.text = userName
        cell.goalProgress.progress = 0.8
        cell.goalProgress.transform = CGAffineTransform(scaleX: 1, y: 4)
        cell.userBestContiDays.text = "30" + "天"
        cell.userCurrentDays.text = "10"
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
