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

class InfoTVC: UITableViewController {

    var infoDict = NSDictionary()
    var topImages = UIImageView()
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
       
        self.automaticallyAdjustsScrollViewInsets = false
        
        allUI()
    }

    
    func allUI()
    {
        topImages.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 250)
        topImages.contentMode = .ScaleAspectFill
        topImages.clipsToBounds = true
        
        
        Alamofire.request(.GET, infoDict["Image"] as! String).responseImage { response in
                debugPrint(response)
                print(response.request)
                print(response.response)
                debugPrint(response.result)
                
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
        return 15
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        
        var rowHeight = CGFloat()
        
        switch indexPath.row
        {
        case 0:
            rowHeight = 250
            
        case 1:
            rowHeight = 200
            
        default :
            break
        }
    
        return rowHeight
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")

    
        switch indexPath.row
        {
        case 0:
            cell.addSubview(topImages)
            
            
        default:
            break
        }
        
        

        return cell
    }
    

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
