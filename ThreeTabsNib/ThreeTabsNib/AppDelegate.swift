//
//  AppDelegate.swift
//  ThreeTabsNib
//
//  Created by Louis Jacobowitz on 7/10/15.
//  Copyright (c) 2015 Louis Jacobowitz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame:UIScreen.mainScreen().bounds)

        let myTabBarController = UITabBarController()
        let myVC1 = FirstViewController(nibName: "FirstViewController", bundle: nil)
        let myVC2 = SecondViewController(nibName: "SecondViewController", bundle: nil)
        let myVC3 = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
        let controllers = [myVC1, myVC2, myVC3]
        myTabBarController.viewControllers = controllers
        let myImage = UIImage(named: "img.jpg")
        myVC1.tabBarItem = UITabBarItem(title: "View 1", image: myImage, tag: 0)
        myVC2.tabBarItem = UITabBarItem(title: "View 2", image: myImage, tag: 1)
        myVC3.tabBarItem = UITabBarItem(title: "View 3", image: myImage, tag: 2)
        
        self.window?.rootViewController = myTabBarController
        
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

