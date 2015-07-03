//
//  nextViewController.swift
//  picturebook
//
//  Created by 桜井諒 on 2015/06/23.
//  Copyright (c) 2015年 桜井諒. All rights reserved.
//

import UIKit
import Photos

let reuseIdentifier = "PhotoCell"
let albumName = "App Folder"            //App specific folder name
var myName = [String]()

class nextViewController: UIViewController,UITextFieldDelegate,UICollectionViewDelegate, UITextViewDelegate,UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITableViewDelegate{
    var albumFound : Bool = false
    var assetCollection: PHAssetCollection!
    var photosAsset: PHFetchResult!
    var index: Int = 0
    
    
    
    

    
    
    var myImageView: UIImageView!
    

    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.hidesBarsOnTap = true    //!!Added Optional Chaining
        
        self.displayPhoto()
    }
    
    func displayPhoto(){
        // Set targetSize of image to iPhone screen size
        let screenSize: CGSize = UIScreen.mainScreen().bounds.size
        let targetSize = CGSizeMake(screenSize.width, screenSize.height)
        
        
        //全てのカメラロールの画像を取得する。(iCloudも含む）
        var assets:PHFetchResult = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: nil)
        println(assets.debugDescription);
        assets.enumerateObjectsUsingBlock({ obj, idx, stop in
            
            if obj is PHAsset
            {
                let asset:PHAsset = obj as! PHAsset;
                println("Asset IDX:\(idx)");
                println("mediaType:\(asset.mediaType)");
                println("mediaSubtypes:\(asset.mediaSubtypes)");
                println("pixelWidth:\(asset.pixelWidth)");
                println("pixelHeight:\(asset.pixelHeight)");
                println("creationDate:\(asset.creationDate)");
                println("modificationDate:\(asset.modificationDate)");
                println("duration:\(asset.duration)");
                println("favorite:\(asset.favorite)");
                println("hidden:\(asset.hidden)");

        let phimgr:PHImageManager = PHImageManager();
        phimgr.requestImageForAsset(asset,
            targetSize: CGSize(width: 320, height: 320),
            contentMode: .AspectFill, options: nil) {
                image, info in
                //ここでUIImageを取得します。
                //self.photoImageView.image = image
                println("UIImage get!");
        }
                
            
        }
    });
    
        let fetchOptions = PHFetchOptions();
        
        var date:NSDate = NSDate();
        date = NSDate(timeIntervalSinceNow: -365*24*60*60);//1年前
        
        fetchOptions.predicate = NSPredicate(format: "creationDate > %@", date);
        fetchOptions.sortDescriptors =  [NSSortDescriptor(key: "creationDate", ascending: false)];
        
    }
    
    //リターンキーが押されたとき
    func tapReturnKey(sender: UITextField) {
        //ユーザーデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        //データを書き込んで
        myDefault.setObject(sender.text, forKey: "myString")
        //即反映させる
        myDefault.synchronize()
    }
    
    
    
    
    var imageView = UIImageView(frame: CGRectMake(67,28,240,240))
    
     override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(imageView)
        self.imageView.backgroundColor = UIColor.blueColor()
        
    }
    
    func btnPhotoAlbum(sender : UIButton) {
        var picker : UIImagePickerController = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]){
        imageView.image = info[UIImagePickerControllerOriginalImage]as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var myTextField: UITextField!

    @IBOutlet var myTextView: UITextView!

    @IBOutlet var myTextView2: UITextView!
    

    
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate


        //AppDelegateのインスタンスを取得
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
        
        appDelegate.myArray[0] = myTextField.text
        appDelegate.myArray[1] = myTextView.text
        appDelegate.myArray[2] = myTextView2.text

    }
            
    else{
        appDelegate.first = myTextField.text
        appDelegate.second = myTextView.text
        appDelegate.third = myTextView2.text
        
            }
        }


    @IBAction func save2() {
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        dainyu()
    }

    
    func dainyu() {
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
        appDelegate.first = myTextField.text
        appDelegate.second = myTextView.text
        appDelegate.third = myTextView2.text
        
        appDelegate.myArray.removeAll()
        
        if appDelegate.first != "" {
            appDelegate.myArray.append(appDelegate.first!)
        }
        if appDelegate.second != ""{
            appDelegate.myArray.append(appDelegate.second!)
        }
        if appDelegate.third != ""{
            appDelegate.myArray.append(appDelegate.third!)
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
    
    






    
  
        
    
    
        
      //  func imagePickerControllerDidCancel(picker: UIImagePickerController){
    //   println("cancel")
    //}
    
    
    
    



        
    
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

