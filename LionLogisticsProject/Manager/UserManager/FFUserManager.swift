//
//  FFUserManager.swift
//  LionLogisticsProject
//
//  Created by zhou on 2019/8/1.
//  Copyright © 2019 MissZhou. All rights reserved.
//

import UIKit

/// 用户登录类型
///
/// - UserLoginTypeIsUnKnow: 未知
/// - UserLoginTypeIsWeChat: 微信登录
/// - UserLoginTypeIsQQ: QQ登录
/// - UserLoginTypeIsPassword: 账号密码登录
enum UserLoginType {
    case UserLoginTypeIsUnKnow
    case UserLoginTypeIsWeChat
    case UserLoginTypeIsQQ
    case UserLoginTypeIsPassword
}

typealias loginBlock = (_ success: Bool, _ descript: String) -> Void

class FFUserManager: NSObject {
    
    static let sharedInstance = FFUserManager()
    private override init(){}

    // MARK: - 第三方登录
    func login(loginType: UserLoginType, completion:loginBlock) -> Void {
        login(loginType: loginType, params: [:], completion: completion)
    }
    
    // MARK: - 带参登录
    func login(loginType: UserLoginType, params: NSDictionary, completion: loginBlock) -> Void {
        loginToService(params: params, completion: completion)
    }
    
    // MARK: - 手动登录到服务器
    func loginToService(params: NSDictionary, completion: loginBlock) -> Void {
        loginSuccess(responeObject: "", completion: completion)
    }
    
    // MARK: - 自动登录到服务器
    func autoLoginToService(completion: loginBlock) -> Void{
        //暂时弃用
    }
    
    // MARK: - 登录成功处理
    func loginSuccess(responeObject: Any ,completion:loginBlock) -> Void {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotificationLoginStateChange), object: true)
    }
    
    // MARK: - 储存用户信息
    func saveUserInfo() -> Void {
        
    }
    
    // MARK: - 加载用户信息
    func loadUserInfo() -> Bool {
        return false
    }
    
    // MARK: - 退出登录
    func logot(completion:loginBlock) -> Void {
        
    }
}
