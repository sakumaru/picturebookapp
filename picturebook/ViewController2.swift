//
//  ViewController2.swift
//  picturebook
//
//  Created by 桜井諒 on 2015/06/25.
//  Copyright (c) 2015年 桜井諒. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //NSUserDefaultsを使うための宣言
    let defaults = NSUserDefaults.standardUserDefaults()
    var assetThumbnailSize:CGSize!

    struct list {
        let name: String
        let thumbnails: String
    }
    var recipes = [list]()

    
    @IBOutlet var tableView: UITableView?
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        //昔"openKey"という鍵で保存したかどうか確認
        if ((defaults.objectForKey("openKey")) != nil){
            
            //objectsを配列として確定させ、前回の保存内容を格納
            let objects = defaults.objectForKey("openKey") as! [String]
            //各名前を格納するための変数を宣言
            var nameString:AnyObject
            //savethemeの中をクリア
            appDelegate.myArray.removeAll()
            //前回の保存内容が格納された配列の中身を一つずつ取り出す
            for nameString in objects{
                //配列に追加していく
                appDelegate.myArray.append(nameString as String)
            }
            for var i = 0; i < 10; ++i {
                appDelegate.myArray.append("")
            }
            appDelegate.myArray.removeAtIndex(0)
            
           TableCell.self;name.text = appDelegate.myArray[0]
            
        }
            
        else{
            TableCell.self;nameLabel.text = appDelegate.first
         

        
    
    
    }
        
    }
    

    
    
    
    
    
    
    @IBOutlet weak var myTableCell: TableCell!
    
    @IBAction func save(){
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        
                               
            //配列をopenKeyで保存
            defaults.setObject(appDelegate.myArray, forKey: "openKey1")
            defaults.synchronize()
            
        }

    
   

    //tablecellの表示など
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier: String = "TableCell"
        
        
        
        var cell: TableCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? TableCell
        if cell == nil {
            cell = TableCell(style: UITableViewCellStyle.Value1,reuseIdentifier: identifier)
        }
        
        //cell!.backgroundColor = UIColor.orangeColor()
        cell!.nameLabel?.text = ViewController2()[indexPath.row].name
        cell!.thumbnailImageView?.image = UIImage(named:ViewController2()[indexPath.row].thumbnails)
        
        
        
        return cell!
    }
    
    
    
    
    //DetailViewControllerについて
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
    
    
    // DetailViewControllerへ名前と画像送信
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "listDetail" {
            let index = self.tableView?.indexPathForSelectedRow()
            var destinationViewController: DetailViewController = segue.destinationViewController as!
            DetailViewController
            
            destinationViewController.nameString = ViewController2()[index!.row].name
            destinationViewController.
            = ViewController2[index!.row].thumbnails
            
            
        }
        
        
        
        
    
    
    
        }
    
    

    
    
     func myHome(sender: UIButton) {
        
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //空の配列を用意する
    var stringArray : [String] = []
    
    
    
    
    
    
            
        
        
        


        
            
            
            
        }

    
    
    
  
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */




