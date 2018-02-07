//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by 近藤 康平 on 2018/01/29.
//  Copyright © 2018年 kohe. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var correctPercentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //問題数を取得
        let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
        
        //正解数を取得する
        var correctCount:Int = 0
        
        //正解数を計算する
        for questionData in QuestionDataManager.sharedInstance.questionDataArray {
            if questionData.isCorrect() {
                //正解数を増やす
                correctCount += 1
            }
        }
        
        //正解率を計算する
        let correctPersent:Float = (Float(correctCount) / Float(questionCount)) * 100
        
        correctPercentLabel.text = String(format:"%.1f", correctPersent) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
