//
//  WSBaseViewController.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/10.
//  Copyright © 2018年 wenshuai. All rights reserved.
//

import UIKit

class WSBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(red: 41/255.0, green: 42/255.0, blue: 47/255.0, alpha: 1.0)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func navTitle(title : String){
        self.navigationItem.title = title
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 31/255.0, green: 32/255.0, blue: 37/255.0, alpha: 1.0)

        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white,
                                                                        NSAttributedString.Key.font : UIFont(name: "Georgia-Bold", size: 18)!]
    }

}
