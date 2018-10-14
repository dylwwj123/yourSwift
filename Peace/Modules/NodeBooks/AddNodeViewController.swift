//
//  AddNodeViewController.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/13.
//  Copyright © 2018 wenshuai. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class AddNodeViewController: WSBaseViewController {

    let NetWorkActivityIndicatorView = UIActivityIndicatorView.init(style:.white)

    override func viewDidLoad() {
        super.viewDidLoad()
        super.navTitle(title: "添加笔记")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.navRightBtn)

        NetWorkActivityIndicatorView.frame = CGRect.init(x: 40, y: 100, width: 60, height: 60)

        NetWorkActivityIndicatorView.hidesWhenStopped = true
        
        self.view.addSubview(NetWorkActivityIndicatorView)
    }
    
    @objc private func navRightBtnSEL(sender:UIButton?){
        NetWorkActivityIndicatorView.startAnimating()
//        NetWorkActivityIndicatorView.stopAnimating()
    }

    lazy var navRightBtn : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x:0, y:0, width:40, height:20)
        btn.setTitle("确定", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 18)
        btn.addTarget(self, action: #selector(navRightBtnSEL(sender:)), for: .touchUpInside)
        return btn
    }()

}
