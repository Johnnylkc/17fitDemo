//
//  MainCell.swift
//  17fitDemo
//
//  Created by 劉坤昶 on 2016/1/10.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    var basicView = UIView()
    var mainImage = UIImageView()
    var className = UILabel()
    var cityName = UILabel()
    

    
    
    override  init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        basicView.frame = CGRectMake(10, 10, 350, 230)
        basicView.backgroundColor = UIColor.whiteColor()
       
        basicView.layer.shadowColor = UIColor.blackColor().CGColor
        basicView.layer.shadowOpacity = 0.3
        basicView.layer.shadowOffset = CGSize(width: 0, height: 2)
        basicView.layer.shadowRadius = 5
        
        basicView.layer.cornerRadius = 5
        contentView.addSubview(basicView)
        
        mainImage.frame = CGRectMake( 0, 0, 350, 150)
        mainImage.backgroundColor = UIColor.lightGrayColor()
        mainImage.contentMode = .ScaleAspectFill
        mainImage.clipsToBounds = true
        basicView.addSubview(mainImage)
        
        
        
        className.frame = CGRectMake(10, 150, 340, 30)
        className.font = UIFont.systemFontOfSize(20)
        className.text = "爆汗快活飛輪"
        basicView.addSubview(className)
        
        cityName.frame = CGRectMake(10, basicView.frame.size.height-25, 200, 20)
        cityName.font = UIFont.systemFontOfSize(15)
        cityName.textColor = UIColor.lightGrayColor()
        cityName.text = "Taiwan Taipei"
        basicView.addSubview(cityName)
        
     
        
        
    }

    
        
    
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
