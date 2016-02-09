//
//  ViewController.swift
//  Clap
//
//  Created by PCUser on 2/9/16.
//  Copyright (c) 2016 PCUser. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var clapPickerView: UIPickerView!
    
    var audioPlayer : AVAudioPlayer!
    var soundCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let soundFilePath = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL = NSURL(fileURLWithPath: soundFilePath)
        
        var audioError:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: &audioError)
        
        if let error = audioError {
            print("音楽ファイルが読み込めませんでした")
            
        }
        
        clapPickerView.delegate = self
        clapPickerView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // いくつカテゴリーを持つか
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // いくつ選択肢をつくるか
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    // 選択肢になにを表示するか
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(row+1)回"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }
    
    @IBAction func playButton(){
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }


    

}

