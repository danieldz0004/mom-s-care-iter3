//
//  MonthListCell.swift
//  MonthProject
//
//  Created by xlkd 24 on 2019/4/23.
//  Copyright © 2019 xlkd 24. All rights reserved.
//

import UIKit

class FoodMonthListCell: UITableViewCell {
    
    fileprivate lazy var titleNameLabel:UILabel = {
        var titleNameLabel:UILabel = UILabel()
        titleNameLabel.textColor = .black
        titleNameLabel.font = UIFont.systemFont(ofSize: 14.0)
        titleNameLabel.textAlignment = .left
        titleNameLabel.numberOfLines = 1
        titleNameLabel.frame = CGRect(x: 15.0, y: 0.0, width: UIScreen.main.bounds.width - 55.0, height: 50.0)
        return titleNameLabel
    }()
    fileprivate lazy var intervalBackView:UIView = {
        var intervalBackView = UIView()
        intervalBackView.backgroundColor = .gray
        intervalBackView.frame = CGRect(x: 15.0, y: 49.5, width: UIScreen.main.bounds.width - 15.0, height: 0.5)
        return intervalBackView
    }()
    
    fileprivate lazy var rightImageView:UIImageView = {
        var rightImageView = UIImageView()
        rightImageView.frame = CGRect(x: UIScreen.main.bounds.width - 40.0, y: 15.0 , width: 20.0, height: 20.0)
        return rightImageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCreatUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configCreatUI() {
        contentView.addSubview(titleNameLabel)
        contentView.addSubview(intervalBackView)
        contentView.addSubview(rightImageView)
        
    }
    func cellModel(title: String,detialOpen:Bool,isOpen:Bool) {
        
        if detialOpen {
            if isOpen {
                rightImageView.image = UIImage.init(named: "openCouponImage")
            } else {
                rightImageView.image = UIImage.init(named: "closeCouponImage")
            }
            if !title.isEmpty {
                titleNameLabel.text = String(format: "%@", title)
            } else {
                titleNameLabel.text = ""
            }
            intervalBackView.isHidden = false
        } else {
            if !title.isEmpty {
                titleNameLabel.text = String(format: "%@", title)
            } else {
                titleNameLabel.text = ""
            }
            intervalBackView.isHidden = true
        }
    }
    
}
