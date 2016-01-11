//
//  SecondVC.swift
//  17fitDemo
//
//  Created by 劉坤昶 on 2016/1/10.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit

class SecondVC: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    var tableview = UITableView()

    override func viewDidLoad()
    {
        super.viewDidLoad()

       
        tableview.delegate = self
        tableview.dataSource = self
        tableview.frame = self.view.frame
        tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableview)

        
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        
        
        
        cell.textLabel?.text = "qweqweqwe"
        cell.detailTextLabel?.text = "123"
        cell.accessoryType = .DisclosureIndicator
        
        
        
        
        return cell
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
