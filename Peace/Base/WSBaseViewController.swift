//
//  WSBaseViewController.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/10.
//  Copyright © 2018年 wenshuai. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class WSBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(red: 41/255.0, green: 42/255.0, blue: 47/255.0, alpha: 1.0)
        
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func navTitle(title : String){
        self.navigationItem.title = title
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 31/255.0, green: 32/255.0, blue: 37/255.0, alpha: 1.0)
        
        self.navigationController?.navigationBar.tintColor = UIColor.white;

        let item = UIBarButtonItem(title: "返回", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white,
                                                                        NSAttributedString.Key.font : UIFont(name: "Georgia-Bold", size: 18)!]
    }
    
    func ActivityIndicatorView(swith : Int){
        if swith == 0 {
            ActivityIndicator.stopAnimating()
        }else if swith == 1 {
            UIApplication.shared.keyWindow?.addSubview(ActivityIndicator)
            ActivityIndicator.startAnimating()
        }
    }
    
    func nowDataTime() -> String {
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let strNowTime = timeFormatter.string(from: date as Date) as String
        return strNowTime
    }

    lazy var ActivityIndicator : NVActivityIndicatorView = {
        let nav =  NVActivityIndicatorView(frame:  CGRect.init(x: kScreenWidth/2-25, y: kScreenHeight/2-25, width: 50, height: 50), type: NVActivityIndicatorType(rawValue: 18)!, color: UIColor.white, padding: 0)
        return nav
    }()

}
