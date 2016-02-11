//
//  LobbyViewController.swift
//  TechMonster
//
//  Created by PCUser on 2/11/16.
//  Copyright © 2016 PCUser. All rights reserved.
//

import UIKit
import AVFoundation

class LobbyViewController: UIViewController, AVAudioPlayerDelegate {

    var stamina: Float = 0
    var staminaTimer: NSTimer!
    var util: TechDraUtility!
    var player: Player!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var staminaBar: UIProgressView!
    @IBOutlet var levelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        player = Player()
        
        staminaBar.transform = CGAffineTransformMakeScale(1.0, 4.0)
        
        // let userDefaults = NSUserDefaults.standardUserDefaults()
        let level: Int = 1 // userDefaults.integerForKey("level")
        
        nameLabel.text = player.name
        levelLabel.text = String(format: "LV. %d", level + 1)
        stamina = 100
        
        util = TechDraUtility()
        cureStamina()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        util.playBGM("lobby")
        // FIXME
    }
    
    override func viewWillDisappear(animated: Bool){
        util.stopBGM()
    }
    
    func cureStamina() {
        staminaTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateStaminaValue", userInfo: nil,  repeats: true)
        staminaTimer.fire()
    }
    
    func updateStaminaValue() {
        if stamina <= 100 {
            stamina = stamina + 1
            staminaBar.progress = stamina / 100
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
