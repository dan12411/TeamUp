//
//  AppDelegate.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/4.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 詢問使用者是否願意收到來自TeamUp的通知
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { granted, error in
                if granted {
                    print("使用者同意了，每天都能收到來自TeamUp的貼心訊息")
                }
                else {
                    print("使用者不同意!T^T")
                }
            })
        
        // 在前景產生通知
        UNUserNotificationCenter.current().delegate = self
    
        
        // 應用程式啟動時連接 Firebase
        FIRApp.configure()
        FIRDatabase.database().persistenceEnabled = true
        let goalsRef = FIRDatabase.database().reference(withPath: "TeamUp-goals")
        goalsRef.keepSynced(true)
        
        // Change NavigationBar color & font
        UINavigationBar.appearance().barTintColor = UIColor(red: 88.0/255.0, green: 178.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        UIApplication.shared.statusBarStyle = .lightContent
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
      
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
      
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

// 在前景產生通知
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .alert])
    }
}

