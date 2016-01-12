//
//  InfoCell.swift
//  17fitDemo
//
//  Created by 劉坤昶 on 2016/1/11.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        


        
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
