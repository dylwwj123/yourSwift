//
//  NodeBooksTableViewCell.swift
//  Peace
//
//  Created by 王文帅 on 2018/10/15.
//  Copyright © 2018 wenshuai. All rights reserved.
//

import UIKit

class NodeBooksTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.time_lab)
        self.contentView.addSubview(self.title_lab)

        setupViews()
    }
    
    func setupViews(){
        self.time_lab.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-30)
        }
        self.title_lab.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.time_lab.snp_bottomMargin).offset(20)
            make.left.equalTo(10)
            make.right.equalTo(-50)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    lazy var time_lab : UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.white
        lab.font = UIFont(name: "Geeza Pro", size: 15)
        return lab
    }()

    lazy var title_lab : UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.white
        lab.font = UIFont(name: "Geeza Pro", size: 15)
        return lab
    }()

}
