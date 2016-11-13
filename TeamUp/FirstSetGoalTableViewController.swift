//
//  FirstSetGoalTableViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/12.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class FirstSetGoalTableViewController: UITableViewController {

    @IBOutlet weak var firstTextLabel: UILabel!
    @IBOutlet weak var goalTitleTextField: UITextField!
    @IBOutlet weak var secTextLabel: UILabel!
    @IBOutlet weak var goalDayLabel: UILabel!
    @IBOutlet weak var goalDaySlider: UISlider!
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        goalDayLabel.text = String(Int(sender.value))
    }
    
    // 回到主畫面
    @IBAction func backToViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // 下一畫面
    @IBAction func next(_ sender: UIButton) {
        performSegue(withIdentifier: "toSec", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstTextLabel.text = "先為自己的目標訂個名字吧！"
        self.secTextLabel.text = "達成這個目標需要幾天呢？"
        
        // NEXT Button
        let nextButton = UIButton(type: .system)
        nextButton.frame = CGRect(x: (self.tableView.frame.size.width / 2) - 50, y: (self.tableView.frame.size.height) * (3 / 4), width: 100, height: 40)
        nextButton.titleLabel?.font = UIFont(name: "STHeitiTC-Light", size: 20)
        nextButton.setTitleColor(UIColor(red: 57.0/255.0, green: 158.0/255.0, blue: 203.0/255.0, alpha: 1.0), for: .normal)
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.setTitle("", for: .highlighted)
        nextButton.addTarget(self, action: #selector(FirstSetGoalTableViewController.next(_:)), for: UIControlEvents.touchUpInside)
        tableView.addSubview(nextButton)
        
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    func addButton() {
        // NEXT Button
        let nextButton = UIButton(type: .system)
        nextButton.frame = CGRect(x: (self.tableView.frame.size.width / 2) - 50, y: (self.tableView.frame.size.height) * (3 / 4), width: 100, height: 40)
        nextButton.titleLabel?.font = UIFont(name: "STHeitiTC-Light", size: 20)
        nextButton.setTitleColor(UIColor(red: 57.0/255.0, green: 158.0/255.0, blue: 203.0/255.0, alpha: 1.0), for: .normal)
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.setTitle("", for: .highlighted)
        nextButton.addTarget(self, action: #selector(FirstSetGoalTableViewController.next(_:)), for: UIControlEvents.touchUpInside)
        tableView.addSubview(nextButton)
        
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 16, width: self.tableView.frame.size.width, height: 12.0))
        let label = UILabel(frame: header.frame)
        label.textColor = UIColor.lightGray
        label.font = UIFont(name: "STHeitiTC-Light", size: 12)
        label.text = "1/4"
        label.frame = header.frame
        label.textAlignment = NSTextAlignment.center
        header.addSubview(label)
        
        return header
    }
    
        // MARK: - TableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


// 收鍵盤
extension FirstSetGoalTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
