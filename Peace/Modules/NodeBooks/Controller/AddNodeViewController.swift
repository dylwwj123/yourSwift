//
//  AddNodeViewController.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/13.
//  Copyright © 2018 wenshuai. All rights reserved.
//

import UIKit

protocol AddNodecallBackDelegate {
    func AddNodecallbackDelegatefuc(backMsg:String)
}

class AddNodeViewController: WSBaseViewController {

    var delegate:AddNodecallBackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.navTitle(title: "添加笔记")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.navRightBtn)
    
        self.view.addSubview(self.textView);
        self.setSubViewLayout()
    }
    
    private func setSubViewLayout() {
        self.textView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(300)
        }
    }
    
    @objc private func navRightBtnSEL(sender:UIButton?){
//        print(NSString.localizedStringWithFormat("%@", self.textView.text))
        if self.textView.text.isEmpty {
            return
        }
        
        let model11 = UserMessageModel()
        model11.books_text = self.textView.text
        model11.books_time = self.nowDataTime()
        SqliteManager.sharedInstance.saveUserMessageModel(userMessageModel: model11)
        
        if((delegate) != nil){
            delegate?.AddNodecallbackDelegatefuc(backMsg: "backMsg---by delegate")
        }
                
        self.navigationController?.popViewController(animated: true)
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
    
    lazy var textView : UITextView = {
        let tv = PlaceholerTextView(placeholder: "记录您的美好时刻!", placeholderColor: UIColor.lightGray, frame: CGRect())
        tv.limitWords = 9999
        tv.backgroundColor = UIColor.init(red: 31/255.0, green: 32/255.0, blue: 37/255.0, alpha: 1.0)
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.textColor = UIColor.white
        tv.tintColor = UIColor.white
        tv.layer.shadowColor = UIColor.white.cgColor
        tv.layer.shadowOpacity = 5
        tv.layer.shadowOffset = CGSize(width: 0, height: 0)
        tv.layer.shadowRadius = 5
        tv.layer.cornerRadius = 10
        tv.clipsToBounds = false
        return tv
    }()
    
}
