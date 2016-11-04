//
//  Goal.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/4.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import Foundation

class goal {
    var goalTitle: String?
    var restNum: Int?
    var memberNum: Int?
    var continNum : Int?
    
    init (goalTitle: String, restNum: Int, memberNum: Int, continNum : Int) {
        self.goalTitle = goalTitle
        self.restNum = restNum
        self.memberNum = memberNum
        self.continNum = continNum
    }
}
