//
//  Goal.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/4.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import Foundation
import Firebase

struct Goal {
    let key: String
    let ref: FIRDatabaseReference?
    var createdAt = ""
    var image = ""
    var goalTitle = ""
    var restNum: Int
    var memberNum: Int
    var continNum: Int
    var monGoal: String?
    var tueGoal: String?
    var wedGoal: String?
    var thuGoal: String?
    var friGoal: String?
    var satGoal: String?
    var sunGoal: String?
    
    init (key: String = "",createdAt: String, image: String, goalTitle: String, restNum: Int, memberNum: Int, continNum : Int) {
        self.key = key
        self.ref = nil
        self.createdAt = createdAt
        self.image = image
        self.goalTitle = goalTitle
        self.restNum = restNum
        self.memberNum = memberNum
        self.continNum = continNum
        self.monGoal = nil
    }
    
    // 用來存入至資料庫
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        createdAt = snapshotValue["createdAt"] as! String
        goalTitle = snapshotValue["goalTitle"] as! String
        restNum = snapshotValue["restNum"] as! Int
        image = snapshotValue["image"] as! String
        memberNum = snapshotValue["memberNum"] as! Int
        continNum = snapshotValue["continNum"] as! Int
        ref = snapshot.ref
        monGoal = snapshotValue["monGoal"] as? String
        tueGoal = snapshotValue["tueGoal"] as? String
        wedGoal = snapshotValue["wedGoal"] as? String
        thuGoal = snapshotValue["thuGoal"] as? String
        friGoal = snapshotValue["friGoal"] as? String
        satGoal = snapshotValue["satGoal"] as? String
        sunGoal = snapshotValue["sunGoal"] as? String
    }
    
    // 用來存入至資料庫
    func toAnyObject() -> Any {
        return [
            "createdAt": createdAt,
            "goalTitle": goalTitle,
            "restNum": restNum,
            "image": image,
            "memberNum": memberNum,
            "continNum": continNum,
            "monGoal" : monGoal ?? "",
            "tueGoal" : tueGoal ?? "",
            "wedGoal" : wedGoal ?? "",
            "thuGoal" : thuGoal ?? "",
            "friGoal" : friGoal ?? "",
            "satGoal" : satGoal ?? "",
            "sunGoal" : sunGoal ?? ""
        ]
    }
}
