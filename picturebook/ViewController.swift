//
//  ViewController.swift
//  picturebook
//
//  Created by 桜井諒 on 2015/06/18.
//  Copyright (c) 2015年 桜井諒. All rights reserved.
//

import UIKit

class ViewController: UIViewController UITextFieldDelegate
private var myTextField: UITextField!

override func viewDidLoad->(){
    


    


let myTextField:UITextField =
UITextField(frame:CGRectMake(0,0,500,30))
myTextField.text = "Hallo World"
myTextField.delegate = self;
myTextField.borderStyle = UITextBorderStyle.RoundedRect
self.view.addSubview(myTextField)

//編集直後
func textFieldDidBeginEditing(textField:UITextField){
    println("textFieldDidBeginEditing:"+textField.text)
}

//編集完了後(編集直後)
func textFieldShouldEndEditing(textField:UITextField) ->Bool{
    println("textFieldShouldEndEditing:"+textField.text)
    return true
}

//編集完了後(完了直後)
func textFieldShouldReturn(textField:UITextField)->Bool{
    textField.resignFirstResponder()
    return true
}

}
