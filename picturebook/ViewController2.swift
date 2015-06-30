//
//  ViewController2.swift
//  picturebook
//
//  Created by 桜井諒 on 2015/06/25.
//  Copyright (c) 2015年 桜井諒. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBAction func myHome(sender: UIButton) {
        
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBOutlet var tableView: UITableView?
    
    struct list{
        let name: String
        let thumbnails: String
    }
    var ViewController2 = [list]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initializeTheList()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func initializeTheList() {
        self.ViewController2 = [list(name: "Egg Benedict", thumbnails: "egg_benedict.jpg"),
            list(name: "Mushroom Risotto", thumbnails: "mushroom_risotto.jpg")]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier: String = "tableCell"
        
        var cell: TableCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? TableCell
        
        if cell == nil {
            cell = TableCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        
        //cell!.backgroundColor = UIColor.orangeColor()
        cell.nameLabel!.text = ViewController2[indexPath.row].name
        cell.thumbnailImageView!.image = UIImage(named:ViewController2[indexPath.row].thumbnails)

        
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController2.count
    }
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 78.0
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
        
        ViewController2.removeAtIndex(indexPath.row)
        
        tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "listDetail" {
            let index = self.tableView?.indexPathForSelectedRow()
            var destinationViewController: DetailViewController = segue.destinationViewController as!
            DetailViewController
            
            destinationViewController.nameString = ViewController2[index!.row].name
            destinationViewController.imageName = ViewController2[index!.row].thumbnails

            
                    }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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

