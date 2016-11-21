//
//  LogInViewController.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/17.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Alamofire
import SwiftyJSON

class LogInViewController: UINavigationController, FBSDKLoginButtonDelegate {

    let fbLoginButton = FBSDKLoginButton()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        
        fbLoginButton.center = self.view.center
        self.view.addSubview(fbLoginButton)
        fbLoginButton.delegate = self
        FBSDKProfile.enableUpdates(onAccessTokenChange: true)
        
        // 檢查是否有FB帳號
        if (FBSDKAccessToken.current() != nil) {
            print("FB Logined!!!!!!!!!")
            print("FB Token: \(FBSDKAccessToken.current().tokenString)")
        }
        print("~~~~~~~~~~~~~~~~~~~~~")
    }
    
    // MARK:- FBSDKLoginButtonDelegate Protocol
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print("===\(error.localizedDescription)")
            return
        }
        
        if let accessToken = result.token.tokenString {
            //FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, email, name"]).start(completionHandler: { (connection: FBSDKGraphRequestConnection?, result: Any?, error: Error?) in
            //if (error == nil){
            //let fbResultDictionary = result as! [String: Any]
            //let id = fbResultDictionary["id"] as! String
            //let email = fbResultDictionary["email"] as! String
            
            //print("\(fbResultDictionary)")
            
            let loginUrl = "http://139.162.41.79/api/login"
            let paras: Parameters = ["access_token": accessToken]
            
            let loginRequest = request(loginUrl, method: .post, parameters: paras, encoding: URLEncoding.default)
            
            print("``````````\(loginRequest)```````````")
            
            loginRequest.responseJSON(completionHandler: { (response: DataResponse<Any>) in
                switch response.result {
                case .success(let value):
                    let userData = JSON(value)
                    
                    if userData["message"] == "Ok" {
                        print("=============OK=============")
                        // 更新使用者登入資訊
//                        var user_Auth = self.myDefaults.object(forKey: "user_Auth") as! [String: Any]
//                        user_Auth["user_id"] = userData["user_id"].intValue
//                        user_Auth["auth_token"] = userData["auth_token"].stringValue
//                        
//                        self.myDefaults.set(user_Auth, forKey: "user_Auth")
                        // 回到主畫面
                        self.dismiss(animated: true, completion: nil)
                        //print("=====close!!!")
                        //self.close(self)
                    } else {
                        print("=============Fail=============")
//                        self.showAlertWithMessage(alertMessage: "登入失敗，請再試一次～")
                    }
                case .failure(let error):
//                    self.showAlertWithMessage(alertMessage: "傳送失敗，請再試一次～")
                    print("=====\(error.localizedDescription)=====")
                }
            })
            //}
            //})
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("=====DidLogOut")
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        print("=====WillLogin")
        return true
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
