//
//  ViewController2.swift
//  picturebook
//
//  Created by 桜井諒 on 2015/06/25.
//  Copyright (c) 2015年 桜井諒. All rights reserved.
//

import UIKit

class ViewController2: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    @IBAction func myHome(sender: UIButton) {
        
       self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //表示するセルの中身
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        return cell
    }
    
    //行数
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
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
