//
//  WSTableBarViewController.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/10.
//  Copyright © 2018年 wenshuai. All rights reserved.
//

import UIKit

class WSTableBarViewController: UITabBarController {

    var tabBarBgImg:UIImageView?
    var tabBarBgImgSelected:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = UIColor.white
        
        self.tabBar.isTranslucent = true
        self.tabBar.barTintColor = UIColor.clear
    
        self.setUpAllChildViewController()
    }
    
    func setUpAllChildViewController() {
        
        self.setUpOneChildViewController(viewController: NodeBooksViewController(), image: UIImage.init(named: "我的")!, selectedImage: UIImage.init(named: "我的")!, title: "随心笔记")

        self.setUpOneChildViewController(viewController: CasualLookViewController(), image: UIImage.init(named: "主页")!, selectedImage: UIImage.init(named: "主页")!, title: "随便逛逛")

    }
    
    func setUpOneChildViewController(viewController: UIViewController, image: UIImage, selectedImage: UIImage, title: NSString) {
        
        let navVC = BaseNavigationController.init(rootViewController: viewController)
        
        navVC.tabBarItem = UITabBarItem.init(title: title as String, image: image, selectedImage: selectedImage.withRenderingMode(.alwaysOriginal))
        
        navVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)

        self.addChild(navVC)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
