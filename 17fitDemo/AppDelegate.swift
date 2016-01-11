//
//  AppDelegate.swift
//  17fitDemo
//
//  Created by 劉坤昶 on 2016/1/10.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let tabBarController = UITabBarController()
    var tabBarIcon = UIImage()
    var tabBarSelectedIcon = UIImage()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {

        let mainPage = MainTVC()
        let mainPageNav = UINavigationController(rootViewController: mainPage)
        mainPage.tabBarItem =
            UITabBarItem(title: "探索", image: UIImage(named: "001"), selectedImage: UIImage(named: "001") )
        
        let secondPage = SecondVC()
        let secondPageNav = UINavigationController(rootViewController: secondPage)
        secondPage.tabBarItem = UITabBarItem(title: "課程列表", image: UIImage(named: "002"), selectedImage: UIImage(named: "002"))
        
        
        
        
        
        let controllers = [mainPageNav,secondPageNav]
        tabBarController.viewControllers = controllers
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

