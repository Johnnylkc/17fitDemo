//
//  InfoTVC.swift
//  17fitDemo
//
//  Created by 劉坤昶 on 2016/1/11.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class InfoTVC: UITableViewController   {

    var infoDict = NSDictionary() //這個在前一頁的MainTVC的didSelect 接 self.jsonArray[indexPath.row]
    var topImages = UIImageView() //要放在table header的圖
   
    var headerView01 = UIView()   //因為table的header 不能只放image 一定得先墊個UIView 這個是實體的view 有給frame 圖片也是加
                                  //在這上面 但後來要變形拉大不是用它 所以他的frame 我指給寬 其他都是零
    
    
    let kTableHeaderHeight:CGFloat = 300  
    var headerView :UIView!
    

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        ////細胞註冊
        self.tableView.registerClass(InfoCell.self, forCellReuseIdentifier: "cell")
       
        ////navBar設定
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        ////這個設定 讓桌子 可以頂到畫面最上面
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        ///大圖 加在桌子的header 的 headerview
        topImages.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 300)
        topImages.contentMode = .ScaleAspectFill
        topImages.clipsToBounds = true
        
        
        
        ///// headerView
        headerView01.frame = CGRectMake(0, 0, tableView.frame.size.width, 0)
        headerView01.backgroundColor = UIColor.grayColor()
        headerView01.addSubview(topImages)
        tableView.tableHeaderView = headerView01
        
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
       
        updateHeaderView()
        
        alamoGET()

    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(true)
        
        ////因為要避免返回上一頁navbar也變透明 所以在viewWillDisappear恢復原本設定
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
        
        
    }



    
    func updateHeaderView()
    {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight
        {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        topImages.frame = headerRect
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView)
    {
        updateHeaderView()
    }
    
    
    func alamoGET()
    {
        
        Alamofire.request(.GET, infoDict["photo"] as! String).responseImage { response in
//                debugPrint(response)
//                print(response.request)
//                print(response.response)
//                debugPrint(response.result)
//                
                if let image = response.result.value
                {
                    print("image downloaded: \(image)")
                    self.topImages.image = image
                }
        }
        
        
    }
  


    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        
    
        return 100
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! InfoCell

        cell.testLabel.text = "rrr"
        
        

        return cell
    }
    

   
}////////////////////////////////////////











