//
//  NodeBooksViewController.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/11.
//  Copyright © 2018年 wenshuai. All rights reserved.
//

import UIKit
import GTMRefresh
import SnapKit

class NodeBooksViewController: WSBaseViewController,UITableViewDelegate,UITableViewDataSource,AddNodecallBackDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.navTitle(title: "随心笔记")
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem(customView: self.navLeftBtn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.navRightBtn)
        
        self.view.addSubview(self.tableView);
        self.setSubViewLayout()
        
        SqliteManager.sharedInstance.createDataBase()
        
        self.tableView.gtm_addRefreshHeaderView(refreshHeader: QQVideoRefreshHeader()) {
            [weak self] in
            self?.databaseUpload()
        }
        self.tableView.triggerRefreshing()
    }
    
    private func setSubViewLayout() {
        self.tableView.snp.makeConstraints { (make) -> Void in
            make.top.left.bottom.right.equalTo(0)
        }
    }
    
    private func databaseUpload() {
        self.arrList = SqliteManager.sharedInstance.selectUserMessage()
        perform(#selector(endRefresing), with: nil, afterDelay: 1)
    }
    
    @objc func endRefresing() {
        self.tableView.endRefreshing(isSuccess: true)
        self.ActivityIndicatorView(swith: 0)
        self.tableView.reloadData()
    }
    
    func AddNodecallbackDelegatefuc(backMsg: String) {
        print(backMsg)
        self.ActivityIndicatorView(swith: 1)
        self.databaseUpload()
    }
    
    @objc private func navLeftBtnSEL(sender:UIButton?){
        SqliteManager.sharedInstance.deleteUserMessage()
    }
    
    @objc private func navRightBtnSEL(sender:UIButton?){
        let nextVC = AddNodeViewController()
        nextVC.delegate=self
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        return self.arrList.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
      
        let identifier : String = "NodeBooksViewControllerCell"
        
        var cell:NodeBooksTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)as?NodeBooksTableViewCell

        if cell == nil {
            cell = NodeBooksTableViewCell(style: .default, reuseIdentifier: identifier)
        }
        
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        cell?.backgroundColor = UIColor.init(red: 37/255.0, green: 37/255.0, blue: 37/255.0, alpha: 1.0)
        
        let model : UserMessageModel = self.arrList.object(at: indexPath.section) as! UserMessageModel
        cell.time_lab.text  = model.books_time
        cell.title_lab.text = model.books_text

        return cell!
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 0.01
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 10.0
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    lazy var arrList: NSMutableArray = {
        var muarr = NSMutableArray()
        return muarr
    }()
    
    lazy var navLeftBtn : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x:0, y:0, width:40, height:20)
        btn.setTitle("搜索", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 16)
        btn.addTarget(self, action: #selector(navLeftBtnSEL(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var navRightBtn : UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x:0, y:0, width:40, height:20)
        btn.setTitle("添加", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 16)
        btn.addTarget(self, action: #selector(navRightBtnSEL(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var tableView : UITableView = {
        let tempList = UITableView.init(frame:self.view.bounds , style: .grouped)
        tempList.delegate = self
        tempList.dataSource = self
        tempList.backgroundColor = UIColor.black
        tempList.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tempList.separatorColor = UIColor.clear
        tempList.tableFooterView = UIView.init()
        tempList.estimatedRowHeight = 0;
        tempList.estimatedSectionHeaderHeight = 0;
        tempList.estimatedSectionFooterHeight = 0;
        return tempList
    }()

}
