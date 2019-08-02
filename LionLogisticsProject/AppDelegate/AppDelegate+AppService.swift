//
//  AppDelegate+AppService.swift
//  LionLogisticsProject
//
//  Created by zhou on 2019/7/31.
//  Copyright © 2019 MissZhou. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    // MARK: - 初始化服务
    func initService() -> Void {
        //登录状态监听
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loginStateChange(notification:)),
                                               name: NSNotification.Name(rawValue: kNotificationLoginStateChange),
                                               object: nil)
        //网络状态监听
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(netWorkStateChage(notification:)),
                                               name: NSNotification.Name(rawValue: kNotificationNetWorkingStateChange),
                                               object: nil)
    }
    
    // MARK: - 初始化Window
    func initWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
    }
    
    // MARK: - 初始化用户系统
    func initUserManager() {
        if FFUserManager.sharedInstance.loadUserInfo() {
            // 如果本地有数据，那么先展示tabbar，随后异步自动登录
            window?.rootViewController = FFTabBarController()
            //自动登录
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotificationAutoLoginSuccess), object: nil)
        } else {
            //没登录过，跳转到登录
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotificationLoginStateChange), object: false)
        }
    }
    
    // MARK: - 登录状态处理
    @objc func loginStateChange(notification: NSNotification) {
        let loginSuccess: Bool = notification.object as! Bool
        if loginSuccess {
            //登录成功加载主窗口控制器
            //为避免自动登录成功刷新tabbar
            if !(window?.rootViewController is FFTabBarController) {
                
                let anima: CATransition = CATransition()
                let type: CATransitionType = CATransitionType(rawValue: "cube")
                
                anima.type = type
                anima.subtype = .fromRight
                anima.duration = 0.3
                
                window?.rootViewController = FFTabBarController()
                window?.layer.add(anima, forKey: "revealAnimation")
            }
        } else {
            //登录失败加载失败页控制器
            let naviLogin = FFNavighationController(rootViewController: FFLoginViewController())
            let anima = CATransition()
            anima.type = .fade
            anima.subtype = .fromRight
            anima.duration = 0.3
            
            window?.rootViewController = naviLogin
            window?.layer.add(anima, forKey: "revealAnimation")
        }
    }
    
    // MARK: - 网络状态变化
    @objc func netWorkStateChage(notification: NSNotification) {
        
    }
    
    // MARK: - 网络状态监听
    func monitorNetWorkState() {
        
    }
    
}
