//
//  CasualLookViewController.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/11.
//  Copyright © 2018年 wenshuai. All rights reserved.
//

import UIKit
import DNSPageView

class CasualLookViewController: WSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.navTitle(title: "随便逛逛")
        
        let style = DNSPageStyle()
        style.isTitleScaleEnabled = true

        let titles = ["头条", "视频", "娱乐"]
        
        let childViewControllers: [AddNodeViewController] = titles.map { _ -> AddNodeViewController in
            let controller = AddNodeViewController()
            return controller
        }
        
        let pageView = DNSPageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: style, titles: titles, childViewControllers: childViewControllers)
        view.addSubview(pageView)
//        self.navigationItem.titleView = UIBarButtonItem(customView: pageView)
    }

}
