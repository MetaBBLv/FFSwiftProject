//
//  FFTabBarController.swift
//  LionLogisticsProject
//
//  Created by zhou on 2019/7/31.
//  Copyright © 2019 MissZhou. All rights reserved.
//

import UIKit

class FFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        addChildViewControllers()
    }
    
    /// 添加子视图控制器
    func addChildViewControllers() {
        setChildViewController(FFSendListViewController(), title: "寄件列表", imageName: "tabbar_sendList_normal_", selectImageName: "tabbar_sendList_select_")
        setChildViewController(FFPublishListViewController(), title: "发布列表", imageName: "tabbar_publishList_normal_", selectImageName: "tabbar_publishList_select_")
        setChildViewController(FFMineViewController(), title: "我的", imageName: "tabbar_mine_normal_", selectImageName: "tabbar_mine_select_")
    }
    
    /// 初始化子视图控制器
    func setChildViewController(_ childController: UIViewController, title: String, imageName: String, selectImageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectImageName)
        childController.title = title
        
        // 设置为默认是 title
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        // 设置选中 title
        childController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red:0.49, green:0.39, blue:0.83, alpha:1.00)], for: .selected)
        
        // 添加导航控制器为 TabBarController 的子控制器
        let nav = FFNavighationController(rootViewController: childController)
        addChild(nav)
    }

}
