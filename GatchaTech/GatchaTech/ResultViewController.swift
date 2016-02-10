//
//  ResultViewController.swift
//  GatchaTech
//
//  Created by PCUser on 2/10/16.
//  Copyright © 2016 PCUser. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var haikeiImageView: UIImageView!
    
    @IBOutlet var monsterImageView: UIImageView!
    
    var monsterArray: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let number = Int(rand() % 8)
        
        monsterArray = [
            UIImage(named: "monster001.png")!,
            UIImage(named: "monster002.png")!,
            UIImage(named: "monster003.png")!,
            UIImage(named: "monster004.png")!,
            UIImage(named: "monster005.png")!,
            UIImage(named: "monster006.png")!,
            UIImage(named: "monster007.png")!,
            UIImage(named: "monster008.png")!,
            UIImage(named: "monster009.png")!,
            UIImage(named: "monster010.png")! ]
        
        monsterImageView.image = monsterArray[ number ]
        
        if number == 9 {
            haikeiImageView.image = UIImage(named: "bg_gold.png")
        }else if number > 6{
            haikeiImageView.image = UIImage(named: "bg_red.png")
            
        }else {
            haikeiImageView.image = UIImage(named: "bg_blue.png")

        }
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let animation = CABasicAnimation(keyPath: "transform")
        
        animation.fromValue = NSNumber(double: 0)
        
        animation.toValue = NSNumber(double: 2 * M_PI)
        
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        
        animation.duration = 5
        
        animation.repeatCount = Float.infinity
        
        haikeiImageView.layer.addAnimation(animation, forKey: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modoru(){
        self.dismissViewControllerAnimated(true, completion: nil)
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
