//
//  ViewController2.swift
//  picturebook
//
//  Created by 桜井諒 on 2015/06/25.
//  Copyright (c) 2015年 桜井諒. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var myLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        myLabel.text =  appDelegate.ViewVal // Labelに値引き渡し用のプロパティから取得して設定する。
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
