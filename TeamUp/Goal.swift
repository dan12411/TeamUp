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
    var usersImage: [String]?
    var usersName: [String]?
    var userBestContiDays: [String]?
    var goalProgress: [Float]?
    
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
        self.usersImage = nil
        self.usersName = nil
        self.userBestContiDays = nil
        self.goalProgress = nil
    }
    
    // 用來存入至資料庫
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String:AnyObject]
        createdAt = snapshotValue["createdAt"] as! String
        goalTitle = snapshotValue["goalTitle"] as! String
        restNum = snapshotValue["restNum"] as! Int
        image = snapshotValue["image"] as! String
        memberNum = snapshotValue["memberNum"] as! Int
        continNum = snapshotValue["continNum"] as! Int
        ref = snapshot.ref
        monGoal = snapshotValue["monGoal"] as? String
        usersImage = snapshotValue["usersImage"] as? [String]
        usersName = snapshotValue["usersName"] as? [String]
        userBestContiDays = snapshotValue["userBestContiDays"] as? [String]
        goalProgress = snapshotValue["goalProgress"] as? [Float]
    }
    
    // 用來存入至資料庫
    func toAnyObject() -> [String:Any] {
        return [
            "createdAt": createdAt,
            "goalTitle": goalTitle,
            "restNum"  : restNum,
            "image": image,
            "memberNum": memberNum,
            "continNum": continNum,
            "monGoal": monGoal ?? "",
            "usersImage": usersImage ?? "",
            "usersName": usersName ?? "",
            "userBestContiDays": userBestContiDays ?? "",
            "goalProgress": goalProgress ?? 0.0
        ]
    }
}

//var tueGoal: String?
//var wedGoal: String?
//var thuGoal: String?
//var friGoal: String?
//var satGoal: String?
//var sunGoal: String?
//
//tueGoal = snapshotValue["tueGoal"] as? String
//wedGoal = snapshotValue["wedGoal"] as? String
//thuGoal = snapshotValue["thuGoal"] as? String
//friGoal = snapshotValue["friGoal"] as? String
//satGoal = snapshotValue["satGoal"] as? String
//sunGoal = snapshotValue["sunGoal"] as? String
//
//"tueGoal" : tueGoal ?? "",
//"wedGoal" : wedGoal ?? "",
//"thuGoal" : thuGoal ?? "",
//"friGoal" : friGoal ?? "",
//"satGoal" : satGoal ?? "",
//"sunGoal" : sunGoal ?? "",
