//
//  MainTVC.swift
//  17fitDemo
//
//  Created by 劉坤昶 on 2016/1/10.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.

import UIKit
import Alamofire
//import AlamofireImage
//import SwiftyJSON

class MainTVC: UITableViewController  {
    
    
    
    var jsonArray = NSMutableArray()
    
    var testButton = UIButton()
    var test01Button = UIButton()
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        
        self.tableView.rowHeight = 250
        
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //細胞註冊 和 桌子外觀設定
        self.tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")
        self.tableView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
        self.tableView.separatorStyle = .None

     
        self.title = "擊沉KMT"
        self.navigationController?.navigationBar.tintColor = UIColor.orangeColor()
        
        
        
        //加號按鈕
        testButton.frame = CGRectMake(300, 550, 50 , 50)
        testButton.backgroundColor = UIColor.redColor()
        testButton.setBackgroundImage(UIImage(named: "plus"), forState: .Normal)
        testButton.layer.cornerRadius = 25
        testButton.layer.shadowColor = UIColor.blackColor().CGColor
        testButton.layer.shadowOpacity = 0.5
        testButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        testButton.layer.shadowRadius = 5
        testButton.addTarget(self, action: "editSomething:", forControlEvents: .TouchUpInside)
        self.tableView.addSubview(testButton)
        
        
        
        
        alamofire()

        
    }
    
    func editSomething(sender:UIButton)
    {
        print("hhh")
    }

    //讓加號按鈕不能被滑動
    override func scrollViewDidScroll(scrollView: UIScrollView)
    {
        testButton.transform = CGAffineTransformMakeTranslation(0,scrollView.contentOffset.y);

    }
    
   
    
    func alamofire()
    {
        let url:String = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=8f6fcb24-290b-461d-9d34-72ed1b3f51f0"
        
        
        Alamofire.request(.GET, url ).responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
            
                if let JSON = response.result.value
                {
                    //print("JSON: \(JSON)")
                    self.jsonArray = JSON["result"]!!["results"] as! NSMutableArray
                    print("抓到囉\(self.jsonArray)")
                    
                }
            
            self.tableView.reloadData()
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
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

        return self.jsonArray.count
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 250
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MainCell

        let dictForCell = self.jsonArray[indexPath.row]
        
        
        //細胞外觀設定
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = .None
        
        
        cell.className.text = dictForCell["ParkName"] as? String
        
        cell.mainImage.image = nil
        
        if dictForCell["Image"] != nil
        {
            
            Alamofire.request(.GET, dictForCell["Image"] as! String).responseImage { response in
//                debugPrint(response)
//                print(response.request)
//                print(response.response)
//                debugPrint(response.result)
                
                if let image = response.result.value 
                {
                    print("image downloaded: \(image)")
                    cell.mainImage.image = image
                    
                }
    
            }
                
        }
        else
        {
            cell.mainImage.backgroundColor = UIColor.lightGrayColor()
        }
        
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let controller = InfoTVC()
        
        controller.infoDict = self.jsonArray[indexPath.row] as! NSDictionary
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }
    
//    override func viewWillAppear(animated: Bool)
//    {
//        super.viewWillDisappear(true)
//        
//        self.tableView.rowHeight = 200
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
