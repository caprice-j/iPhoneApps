//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [AnyObject]()
    
    //正解数
    var correctAnswer:Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [AnyObject]()
        
        //------------------------ここから下にクイズを書く------------------------//
        tmpArray.append(["これは、私わたしが小さいときに、村の茂平もへいというおじいさんからきいたお話です。\nむかしは、私たちの村のちかくの、中山なかやまというところに小さなお城があって、中山さまというおとのさまが、おられたそうです。","かぶと虫","ごん狐","のら犬",2])
        tmpArray.append(["二人の若い紳士が、すっかりイギリスの兵隊のかたちをして、ぴかぴかする鉄砲をかついで、白熊のような犬を二疋ひきつれて、だいぶ山奥の、木の葉のかさかさしたとこを、こんなことを云いながら、あるいておりました。\n「ぜんたい、ここらの山は怪けしからんね。鳥も獣も一疋も居やがらん。なんでも構わないから、早くタンタアーンと、やって見たいもんだなあ。」","気のいい火山弾","注文の多い料理店","チュウリップの幻術", 2])
        tmpArray.append(["　私は、その男の写真を三葉、見たことがある。\n一葉は、その男の、幼年時代、とでも言うべきであろうか、十歳前後かと推定される頃の写真であって、その子供が大勢の女のひとに取りかこまれ、（それは、その子供の姉たち、妹たち、それから、従姉妹たちかと想像される）庭園の池のほとりに、荒い縞の袴をはいて立ち、首を三十度ほど左に傾け、醜く笑っている写真である。醜く？","人間失格","風の便り","グッド・バイ", 1])
        
        //------------------------ここから上にクイズを書く------------------------//
        
        // 問題をシャッフルしてquizArrayに格納する
        while (tmpArray.count > 0) {
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as! String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, forState: .Normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
        }
        
        quizArray.removeAtIndex(0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


