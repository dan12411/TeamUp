//
//  MyNavigationController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/15.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController {

    var goal: Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("Navi_goal: ===============\(goal)==================")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
