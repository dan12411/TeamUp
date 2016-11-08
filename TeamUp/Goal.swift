//
//  Goal.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/4.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import Foundation
import Firebase

struct goal {
    let key: String
    let ref: FIRDatabaseReference?
    var image = ""
    var goalTitle = ""
    var restNum: Int
    var memberNum: Int
    var continNum : Int
    
    init (key: String = "", image: String, goalTitle: String, restNum: Int, memberNum: Int, continNum : Int) {
        self.key = key
        self.ref = nil
        self.image = image
        self.goalTitle = goalTitle
        self.restNum = restNum
        self.memberNum = memberNum
        self.continNum = continNum
    }
    
    // ????
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        goalTitle = snapshotValue["goalTitle"] as! String
        restNum = snapshotValue["restNum"] as! Int
        image = snapshotValue["image"] as! String
        memberNum = snapshotValue["memberNum"] as! Int
        continNum = snapshotValue["continNum"] as! Int
        ref = snapshot.ref
    }
    
    // 用來存入至資料庫
    func toAnyObject() -> Any {
        return [
            "goalTitle": goalTitle,
            "restNum": restNum,
            "image": image,
            "memberNum": memberNum,
            "continNum": continNum
        ]
    }
}
