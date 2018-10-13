//
//  AddNodeViewController.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/13.
//  Copyright © 2018 wenshuai. All rights reserved.
//

import UIKit

class AddNodeViewController: WSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.navTitle(title: "添加笔记")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.navRightBtn)

    }
    
    @objc private func navRightBtnSEL(sender:UIButton?){
        
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
