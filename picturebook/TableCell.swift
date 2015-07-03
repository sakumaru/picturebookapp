//
//  TableCell.swift
//  Swift-TableView-Example
//
//  Created by Bilal ARSLAN on 11/10/14.
//  Copyright (c) 2014 Bilal ARSLAN. All rights reserved.
//

import Foundation
import UIKit

class TableCell : UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var thumbnailImageView: UIImageView?
    
    //AppDelegateのインスタンスを取得
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var name: String?
    var imageName: String?
    
    override func prepareForReuse() {
    
        UIImage(named: imageName!) = thumbnailImageView?.image
        name! = nameLabel?.text!

        

           
        
    }
    
    
}

