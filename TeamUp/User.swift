//
//  User.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/8.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let email: String
    
    init(authData: FIRUser) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
    
}
