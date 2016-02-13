//
//  ResultViewController.swift
//  GatchaTest
//
//  Created by PCUser on 2/13/16.
//  Copyright © 2016 PCUser. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var monsterImageView: UIImageView!
    
    var monsterImageArray : [UIImage]! =
    [
        UIImage(named: "monster001.png")!,
        UIImage(named: "monster002.png")!,
        UIImage(named: "monster003.png")!,
        UIImage(named: "monster004.png")!,
        UIImage(named: "monster005.png")!,
        UIImage(named: "monster006.png")!,
        UIImage(named: "monster007.png")!,
        UIImage(named: "monster008.png")!,
        UIImage(named: "monster009.png")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let monsterIndexInt: Int = random() % monsterImageArray.count
        
        monsterImageView.image = monsterImageArray[ monsterIndexInt ]
        
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
