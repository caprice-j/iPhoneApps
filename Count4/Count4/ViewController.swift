//
//  ViewController.swift
//  Count4
//
//  Created by PCUser on 2/13/16.
//  Copyright © 2016 PCUser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberLabel: UILabel!
    
    var n: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func p(){
        n = n + 1
        numberLabel.text = String(n)
    }

    @IBAction func m(){
        n = n - 1
        numberLabel.text = String(n)
    }

    @IBAction func c(){
        n = 0
        numberLabel.text = String(n)
    }


}

