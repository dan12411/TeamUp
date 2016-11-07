//
//  GoalTableViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/5.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class GoalTableViewController: UITableViewController {
    
    @IBOutlet weak var firstTextLabel: UILabel!
    @IBOutlet weak var goalTitleTextField: UITextField!
    @IBOutlet weak var firstTextLabel2: UILabel!
    @IBOutlet weak var secTextLabel: UILabel!
    @IBOutlet weak var goalDayLabel: UILabel!
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        goalDayLabel.text = String(Int(sender.value))
    }
    @IBOutlet weak var triTextLabel: UILabel!
    @IBOutlet weak var triSubTextLabel: UILabel!
    @IBOutlet weak var goalContentTextField: UITextField!
    @IBOutlet weak var triSubTextLabel2: UILabel!
    @IBOutlet weak var fouTextLabel: UILabel!

    @IBAction func monGoal(_ sender: UIButton) {
        self.triSubTextLabel.text = "星期一的行動計畫"
    }
    @IBAction func tueGoal(_ sender: UIButton) {
        self.triSubTextLabel.text = "星期二的行動計畫"
    }
    @IBAction func wedGoal(_ sender: UIButton) {
        self.triSubTextLabel.text = "星期三的行動計畫"
    }
    @IBAction func thrGoal(_ sender: UIButton) {
        self.triSubTextLabel.text = "星期四的行動計畫"
    }
    @IBAction func friGoal(_ sender: UIButton) {
        self.triSubTextLabel.text = "星期五的行動計畫"
    }
    @IBAction func satGoal(_ sender: UIButton) {
        self.triSubTextLabel.text = "星期六的行動計畫"
    }
    @IBAction func sunGoal(_ sender: UIButton) {
        self.triSubTextLabel.text = "星期日的行動計畫"
    }
    
    // 回到主畫面
    @IBAction func backToViewController(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.firstTextLabel.text = "先為自己的目標訂個名字吧！"
        goalTitleTextField.underlined()
        self.firstTextLabel2.text = "例如：考上臺大 或 業績達成"
        self.secTextLabel.text = "達成這個目標需要幾天呢？"
        self.triTextLabel.text = "以週為單位，選定哪幾天要行動吧！"
        goalContentTextField.underlined()
        self.triSubTextLabel2.text = "例如：看一篇New York Times"
        self.fouTextLabel.text = "挑選適合的圖來當封面吧！"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
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


// Text Field with underline
extension UITextField {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}