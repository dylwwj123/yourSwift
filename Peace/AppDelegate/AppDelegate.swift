//
//  AppDelegate.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/10.
//  Copyright © 2018年 wenshuai. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 应用程序启动后自定义的重载点。
        
        //设置tabbar
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        //初始化tabbar
        let tabbarVC = WSTableBarViewController()
        self.window!.rootViewController = tabbarVC
        self.window!.makeKeyAndVisible()
        
        UINavigationBar.appearance().barStyle = .blackOpaque

        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // 当应用程序即将从活动状态转移到非活动状态时发送。这可以发生在某些类型的临时中断（如来电或SMS消息）或当用户退出应用程序并开始转换到后台状态时。
        // 使用此方法暂停正在执行的任务，禁用定时器，并使图形呈现回调无效。游戏应该用这个方法暂停游戏。.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // 使用此方法释放共享资源，保存用户数据，使定时器失效，并存储足够的应用程序状态信息，以便在以后终止应用程序时将应用程序恢复到当前状态。
        // 如果应用程序支持后台执行，则当用户退出时调用此方法而不是applicationWillTerminate。
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // 作为从后台到活动状态的转换的一部分调用；在这里可以撤消在进入后台时所做的许多更改。
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // 重新启动在应用程序处于非活动状态时暂停（或尚未启动）的任何任务。如果应用程序以前位于后台，则可选地刷新用户界面.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // 当应用程序即将终止时调用。保存数据，如果合适的话。参见ApdioDestEntudio背景。
    }


}

