//
//  EachGoalViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/10.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class EachGoalViewController: UIViewController {

    @IBOutlet weak var restDayLabel: UILabel!
    var restDay: String?
    @IBOutlet weak var memberNumLabel: UILabel!
    var memberNum: String?
    @IBOutlet weak var goalListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = restDay {
            restDayLabel.text = text
        }
        if let text = memberNum {
            memberNumLabel.text = text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
