//
//  QuestionViewController.swift
//  MyQuiz
//
//  Created by 近藤 康平 on 2018/01/17.
//  Copyright © 2018年 kohe. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var questionData: QuestionData!
    @IBOutlet weak var questionNoLabel: UILabel! //問題番号ラベル
    
    @IBOutlet weak var questionTextView: UITextView! //問題文テキストビュー
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBOutlet weak var correctImageView: UIImageView! //正解時のイメージビュー
    @IBOutlet weak var incorrectImageView: UIImageView! //不正解時のイメージビュー

    //初期データ設定処理. 前画面で設定済みのquestionDataから値を取り出す
    override func viewDidLoad() {
        super.viewDidLoad()
        questionNoLabel.text = "Q.\(questionData.questionNo)"
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1, for: UIControlState.normal)
        answer2Button.setTitle(questionData.answer2, for: UIControlState.normal)
        answer3Button.setTitle(questionData.answer3, for: UIControlState.normal)
        answer4Button.setTitle(questionData.answer4, for: UIControlState.normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }

}
