//
//  ViewController.swift
//  picturebook
//
//  Created by 桜井諒 on 2015/06/18.
//  Copyright (c) 2015年 桜井諒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
  
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "next") {
        }
    }
    
    @IBAction func push(sender : UIButton) {
        performSegueWithIdentifier("next",sender: nil)
    }
    
    @IBAction func returnMenu(segue: UIStoryboardSegue){
        if (segue.identifier == "戻る") {
        }
        
    }
    
    
}

