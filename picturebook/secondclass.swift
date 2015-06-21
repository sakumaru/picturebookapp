//
//  secondclass.swift
//  picturebook
//
//  Created by 桜井諒 on 2015/06/20.
//  Copyright (c) 2015年 桜井諒. All rights reserved.
//

import UIKit

class secondclass: UIViewController,UITextFieldDelegate{
    
    private var myTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UITextFieldを作成する
        
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        
        // 表示する文字を代入する.
        myTextField.text = "Hello Swift!!"
        
        // Delegateを設定する.
        myTextField.delegate = self
        
        // 枠を表示する.
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        
        // UITextFieldの表示する位置を設定する.
        myTextField.layer.position = CGPoint(x:self.view.bounds.width/2,y:100);
        
        // Viewに追加する.
        self.view.addSubview(myTextField)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /*
    UITextFieldが編集された直後に呼ばれるデリゲートメソッド.
    */
    
    func textFieldDidBeginEditing(textField: UITextField){
        println("textFieldDidBeginEditing:" + textField.text)
    }
    
    /*
    UITextFieldが編集終了する直前に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        println("textFieldShouldEndEditing:" + textField.text)
        
        return true
    }
    
    /*
    改行ボタンが押された際に呼ばれるデリゲートメソッド.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}

    
//textviewがフォーカスされたら、Labelを非表示
func textViewShouldBeginEditing(textView: UITextView) -> Bool
{
    lbl.hidden = true
    return true
}

//textviewからフォーカスが外れて、TextViewが空だったらLabelを再び表示
func textViewDidEndEditing(textView: UITextView) {
    
    if(textView.text.isEmpty){
        lbl.hidden = false
    }
}