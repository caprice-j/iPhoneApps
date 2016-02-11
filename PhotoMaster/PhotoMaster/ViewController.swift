//
//  ViewController.swift
//  PhotoMaster
//
//  Created by PCUser on 2/11/16.
//  Copyright © 2016 PCUser. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // カメラ、アルバムを呼び出すメソッド(カメラorアルバムのソースタイプが引数)
    func precentPickerController(sourceType: UIImagePickerControllerSourceType) {
        
        // ライブラリが使用できるかを判定
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            
            picker.sourceType = sourceType
            
            picker.delegate = self
            
            self.presentViewController(picker, animated: true, completion: nil)
        }else{
            // どうやら 「カメラ」を iPhone 6 のシミュレーターで選択したときはこちらになる様子
            
            let alertController = UIAlertController(title: "That source type is ", message: "Unavailable.", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    // 写真が選択された時に呼び出されるメソッド
    func imagePickerController(
        picker: UIImagePickerController!,
        didFinishPickingImage image: UIImage!, editingInfo: NSDictionary! ) {
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            photoImageView.image = image
    }
    
    @IBAction func selectButtonTapped(sender: UIButton) {
        
        let alertController = UIAlertController(
            title: "画像の取得先を選択", message: nil, preferredStyle: .ActionSheet)
        
        let firstAction = UIAlertAction(title: "カメラ", style: .Default) {
            action in self.precentPickerController(.Camera)
        }
        let secondAction = UIAlertAction(title: "アルバム", style: .Default) {
            action in self.precentPickerController(.PhotoLibrary)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .Cancel, handler: nil)
        
        // 選択肢をアラートに登録する
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(cancelAction)
        
        // アラートを表示する
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func drawText(image: UIImage) -> UIImage {
        
        let text = "life is tech \nxmascamp "
        
        // グラフィックスコンテキスト生成、編集を開始
        UIGraphicsBeginImageContext(image.size)
        
        // 読み込んだ写真を描き出す
        image.drawInRect(CGRectMake(0,0,image.size.width, image.size.height))
        
        // 描き出す位置と大きさの設定 ( 左からのｘ座標 px, 上からの y 座標 px, ... )
        let textRect = CGRectMake(5,5,image.size.width-5, image.size.height-5)
        
        let textFontAttributes = [
            NSFontAttributeName: UIFont.boldSystemFontOfSize(120),
            NSForegroundColorAttributeName: UIColor.redColor(),
            NSParagraphStyleAttributeName: NSMutableParagraphStyle.defaultParagraphStyle()
        ]
        
        text.drawInRect(textRect, withAttributes:  textFontAttributes)
        
        // グラフィックスコンテキストの画像を取得
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // グラフィックスコンテキストの編集を修了
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func drawMaskImage(image: UIImage) -> UIImage {
        
        UIGraphicsBeginImageContext(image.size)
        
        image.drawInRect(CGRectMake(0,0,image.size.width,image.size.height))
        
        // マスク画像。保存場所は PhotoMaster > Assets.xcassets
        let maskImage = UIImage(named: "clap-button")
        
        let offset: CGFloat = 50.0
        let maskRect = CGRectMake(
            image.size.width  - maskImage!.size.width  - offset,
            image.size.height - maskImage!.size.height - offset,
            maskImage!.size.width,
            maskImage!.size.height
        )
        
        // maskRectで指定した範囲に、maskImageを書き出す
        maskImage!.drawInRect(maskRect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
        
    }

    func simpleAlert(titleString: String) {
        let alertController = UIAlertController(title: titleString, message: nil, preferredStyle:  .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func postToSNS(serviceType: String){
        
        // 
        let myComposeView = SLComposeViewController(forServiceType: serviceType)
        
        myComposeView.setInitialText("Post from PhotoMaster ")
        
        myComposeView.addImage(photoImageView.image)
        
        self.presentViewController(myComposeView, animated: true, completion: nil)
    }
    
    @ IBAction func uploadButtonTapped(sender: UIButton){
        guard let selectedPhoto =  photoImageView.image else {
            simpleAlert("画像がありません")
            return
        }
        
        let alertController = UIAlertController(title: "アップロード先を選択", message: nil, preferredStyle: .ActionSheet)
        
        let firstAction = UIAlertAction(title: "Facebook", style: .Default) {
            action in self.postToSNS(SLServiceTypeFacebook)
        }
        let secondAction = UIAlertAction(title: "Twitter", style: .Default) {
            action in self.postToSNS(SLServiceTypeTwitter)
        }
        let thirdAction = UIAlertAction(title: "Camera roll", style: .Default) {
            action in UIImageWriteToSavedPhotosAlbum(selectedPhoto, self, nil, nil)
            self.simpleAlert("アルバムに保存されました")
        }

        let cancelAction = UIAlertAction(title: "キャンセル", style: .Cancel, handler: nil)
        
        // 選択肢をアラートに登録する
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(thirdAction)
        alertController.addAction(cancelAction)
        
        // アラートを表示する
        presentViewController(alertController, animated: true, completion: nil)


    }
    
    @IBAction func processButtonTapped(sender: UIButton){
        guard let selectedPhoto = photoImageView.image else{
            simpleAlert("画像がありません")
            return
        }
        
        let alertController = UIAlertController(title: "合成するパーツを選択", message: nil, preferredStyle: .ActionSheet)
        let firstAction = UIAlertAction(title: "テキスト", style:.Default) {
            action in
            
            // selectedPhotoにテキストを合成して画面に描き出す
            self.photoImageView.image = self.drawText(selectedPhoto)
        }
        let secondAction = UIAlertAction(title: "手拍子マーク", style:.Default) {
            action in
            
            // selectedPhotoにテキストを合成して画面に描き出す
            self.photoImageView.image = self.drawMaskImage(selectedPhoto)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .Cancel, handler: nil)
        
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

