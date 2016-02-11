//
//  ViewController.swift
//  PhotoMaster
//
//  Created by PCUser on 2/11/16.
//  Copyright © 2016 PCUser. All rights reserved.
//

import UIKit

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
        // didFinishPickingImage,                 // この引数があやしい
        image: UIImage!, editingInfo: NSDictionary! ) {
            
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

