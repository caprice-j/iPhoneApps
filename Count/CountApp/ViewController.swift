//
//  ViewController.swift
//  CountApp
//
//  Created by PCUser on 2/5/16.
//  Copyright (c) 2016 PCUser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number: Int = 0;
    @IBOutlet var label_b: UILabel!  // binary
    @IBOutlet var label_o: UILabel!  // octal
    @IBOutlet var label:   UILabel!  // decimal
    @IBOutlet var label_h: UILabel!  // hexadecimal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    let goToNextLine: String = "\n" // n : newline
    
    func organizeNumberIntoPyramid( targetNumber: Int, base: Int) -> String {
        
        var remaining_number: Int = targetNumber;
        var current_val: Int = 0;
        var pyramid: String = "";
        
        var EachPosStr = [ "", "",  "", "", "", "", "" ]
        
        // set each position's string
        while( remaining_number >= 0 ){
            
            if( EachPosStr[ 0 ] == "0" ){
                EachPosStr[ 0 ] = ""
            }
            EachPosStr[ 0 ] += String(current_val)
            
            if( current_val == base ){
                // ku ri a ga ri
                
                current_val = 0 // restart from 1
                EachPosStr[ 0 ] = "0"
                
                var UpperPosIndex: Int = 1
                if( EachPosStr[ UpperPosIndex ] == "0" ){
                    EachPosStr[ UpperPosIndex ] = ""
                }
                var upperNum: Int;
                // print(EachPosStr[1])
                upperNum =
                    count(EachPosStr[ UpperPosIndex ]) + 1
                
                while( upperNum == base ){
                    EachPosStr[ UpperPosIndex ] = "0"
                    UpperPosIndex += 1
                    if( EachPosStr[ UpperPosIndex ] == "0" ){
                        EachPosStr[ UpperPosIndex ] = ""
                    }
                    upperNum = count(EachPosStr[ UpperPosIndex ]) + 1
                }
                var tmp: Int = count(EachPosStr[ UpperPosIndex ]) + 1
                EachPosStr[ UpperPosIndex ] += String( tmp )
                
            }
            current_val = current_val + 1
            
            remaining_number = remaining_number - 1
            
        }
        
        // construct pyramid
        // pyramid = pyramid + goToNextLine;
        for str in EachPosStr.reverse() {
            pyramid += str + goToNextLine
        }
        
        return pyramid
    }
    
    @IBAction func plus(){
        // set maximum number of each label as infinity.
        // Only the first line would appear without this assignment.
        label.numberOfLines = 10
        label_b.numberOfLines = 10
        label_o.numberOfLines = 10
        
        number = number + 1
        
        label.text   = organizeNumberIntoPyramid( number, base: 10)
        label_b.text = organizeNumberIntoPyramid( number, base: 2 )
        label_o.text = organizeNumberIntoPyramid( number, base: 8 )
    }
    @IBAction func minus(){
        // set maximum number of each label as infinity.
        // Only the first line would appear without this assignment.
        label.numberOfLines = 10
        label_b.numberOfLines = 10
        label_o.numberOfLines = 10
        
        number = number - 1
        
        label.text   = organizeNumberIntoPyramid( number, base: 10 )
        label_b.text = organizeNumberIntoPyramid( number, base: 2 )
        label_o.text = organizeNumberIntoPyramid( number, base: 8 )
    }


}

