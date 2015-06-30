//
//  nextViewController.swift
//  picturebook
//
//  Created by 桜井諒 on 2015/06/23.
//  Copyright (c) 2015年 桜井諒. All rights reserved.
//

import UIKit

class nextViewController: UIViewController{
    
    
    @IBOutlet weak var myTextField: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        }
    
    //リターンキーが押されたとき
    @IBAction func tapReturnKey(sender: UITextField) {
        //ユーザーデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        //データを書き込んで
        myDefault.setObject(sender.text, forKey: "myString")
        //即反映させる
        myDefault.synchronize()
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    @IBOutlet weak var myTextView: UITextView!
    
    
    
    @IBOutlet weak var myTextView2: UITextView!
  
    
    
    @IBAction func returnMenu(segue: UIStoryboardSegue) {
        
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
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
