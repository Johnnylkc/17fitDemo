//
//  Networking.swift
//  17fitDemo
//
//  Created by 劉坤昶 on 2016/1/13.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import Foundation
import Alamofire


class Networking
{
    
    var kkArray : NSMutableArray?
    
    init ( kkArray:NSMutableArray)
    {
        self.kkArray = kkArray
    
    }
    
    class func alamofireGET(url:String) -> NSMutableArray
    {
        var orignalArray = NSMutableArray()
        
        Alamofire.request(.GET, url).responseJSON { response in
        
            if let JSON = response.result.value
            {
                //print("JSON: \(JSON)")
                orignalArray = JSON["data"] as! NSMutableArray
                print("抓到囉\(orignalArray)")
                
            }
            
        }

        return orignalArray
    }



}