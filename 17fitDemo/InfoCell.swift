//
//  InfoCell.swift
//  17fitDemo
//
//  Created by 劉坤昶 on 2016/1/11.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    
    //var gradientLayer = CAGradientLayer()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       // gradientLayer.frame = contentView.bounds
//        let color1 = UIColor.clearColor().CGColor
//        let color2 = UIColor.whiteColor().CGColor
//        let colorsArray = [color1,color2]
//        gradientLayer.colors = colorsArray
//        contentView.addsubl

        
    }

    
    
    required init?(coder aDecoder: NSCoder)
    {
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
