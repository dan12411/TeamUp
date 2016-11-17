//
//  TriSetGoalTableViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/12.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class TriSetGoalTableViewController: UITableViewController {

    // MARK: Properties
    var goal: Goal?
    @IBOutlet weak var triTextLabel: UILabel!
    @IBOutlet weak var monTextField: UITextField!
    @IBOutlet weak var tueTextField: UITextField!
    @IBOutlet weak var wedTextField: UITextField!
    @IBOutlet weak var thuTextField: UITextField!
    @IBOutlet weak var friTextField: UITextField!
    @IBOutlet weak var satTextField: UITextField!
    @IBOutlet weak var sunTextField: UITextField!
    @IBAction func settingContent(_ sender: Any) {
        monTextField.text = "讀英文小說兩頁"
        wedTextField.text = "讀英文小說兩頁"
        friTextField.text = "讀英文小說兩頁"
    }
    
    // 回到主畫面
    @IBAction func backToViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func next(_ sender: UIButton) {
        performSegue(withIdentifier: "toFou", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("goal3: ===================\(goal)=======================")
        self.triTextLabel.text = "再為剛剛選擇的星期，制訂行動計畫吧！如果每次都一樣，就填上一天後，勾選『每次都一樣』"     
        
        // NEXT Button
        let nextButton = UIButton(type: .system)
        nextButton.frame = CGRect(x: (self.tableView.frame.size.width / 2) - 50, y: (self.tableView.frame.size.height) * (3 / 4), width: 100, height: 40)
        nextButton.titleLabel?.font = UIFont(name: "STHeitiTC-Light", size: 20)
        nextButton.setTitleColor(UIColor(red: 57.0/255.0, green: 158.0/255.0, blue: 203.0/255.0, alpha: 1.0), for: .normal)
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.setTitle("", for: .highlighted)
        nextButton.addTarget(self, action: #selector(TriSetGoalTableViewController.next(_:)), for: UIControlEvents.touchUpInside)
        tableView.addSubview(nextButton)
        
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - TableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 16, width: self.tableView.frame.size.width, height: 12.0))
        let label = UILabel(frame: header.frame)
        label.textColor = UIColor.lightGray
        label.font = UIFont(name: "STHeitiTC-Light", size: 14)
        label.text = "3/4"
        label.frame = header.frame
        label.textAlignment = NSTextAlignment.center
        header.addSubview(label)
        
        return header
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFou" {
            let dvc = segue.destination as? FouSetGoalTableViewController
            guard let text1 = monTextField.text else { return }
            
            if var goal = goal {
                goal.monGoal = text1
                dvc?.goal = goal
                print("goal3-segue: ===================\(goal)=======================")
            }
        }
    }
    
}

extension TriSetGoalTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

