//
//  nextViewController.swift
//  picturebook
//
//  Created by 桜井諒 on 2015/06/23.
//  Copyright (c) 2015年 桜井諒. All rights reserved.
//

import UIKit

class nextViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {
    
    @IBOutlet weak var myTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        }
    
       
        
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated) //エフェクト関係のパラメタだと思うが、今回は使用しないので、基底クラスを呼び出して、終わり。
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateオブジェクトの呼び出し。as ◯◯はSwiftのキャスト表現
        appDelegate.ViewVal = myTextField.text // TextFieldの値を取得し、値引き渡し用のプロパティにセット
    }
    
  
    
    
    @IBAction func returnMenu(segue: UIStoryboardSegue) {
        
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func tapReturnKey(sender: UITextField) {
         myTextField.resignFirstResponder()

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
