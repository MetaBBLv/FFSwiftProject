//
//  FFLoginViewController.swift
//  FFAcssell
//
//  Created by zhou on 2019/8/1.
//  Copyright © 2019 MissZhou. All rights reserved.
//

import UIKit

class FFLoginViewController: FFBaseViewController {
    
    var loginBtn: UIButton?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    

    func setupUI() {
        loginBtn = UIButton(type: .custom)
        loginBtn?.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        loginBtn?.backgroundColor = UIColor.orange
        loginBtn?.setTitle("登录", for: .normal)
        view.addSubview(loginBtn!)
        
        loginBtn?.addTarget(self, action: #selector(loginBtnAction), for: .touchUpInside)
    }
    
    // MARK: - event
    @objc func loginBtnAction() {
        FFUserManager.sharedInstance.login(loginType: .UserLoginTypeIsPassword, params: ["account":"18698807852","password":"123456"]) { (success, description) in
            if success {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotificationLoginStateChange), object: true)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
